package com.std.util;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.nio.file.FileSystems;
import java.nio.file.Path;
import java.util.Base64;

import javax.imageio.ImageIO;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

public class QRCodeGenerator {

	public static String generateQRCodeBase64(String data) {
		try {
			QRCodeWriter qrCodeWriter = new QRCodeWriter();
			BitMatrix bitMatrix = qrCodeWriter.encode(data, BarcodeFormat.QR_CODE, 250, 250);
			BufferedImage qrImage = MatrixToImageWriter.toBufferedImage(bitMatrix);

			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			ImageIO.write(qrImage, "png", baos);
			byte[] qrBytes = baos.toByteArray();

			return Base64.getEncoder().encodeToString(qrBytes);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public static void generateQRCodeImage(String qrContent, int width, int height, String qrCodeFullPath) {
		try {
			QRCodeWriter qrCodeWriter = new QRCodeWriter();
			BitMatrix bitMatrix = qrCodeWriter.encode(qrContent, BarcodeFormat.QR_CODE, width, height);

			Path path = FileSystems.getDefault().getPath(qrCodeFullPath);
			MatrixToImageWriter.writeToPath(bitMatrix, "PNG", path);

			System.out.println("QR Code generated at: " + qrCodeFullPath);
		} catch (WriterException e) {
			System.err.println("Could not generate QR Code, WriterException :: " + e.getMessage());
		} catch (IOException e) {
			System.err.println("Could not generate QR Code, IOException :: " + e.getMessage());
		}
	}
}
