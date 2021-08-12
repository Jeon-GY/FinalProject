package www.TPP.com.common.attachFile.model;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

public enum MultiMediaType {
	image, video, audio, others;
	
	public static MultiMediaType identifyMultiMediaType(File file) {
		String contentType = null;
		try {
			contentType = Files.probeContentType(file.toPath());
		} catch (IOException e) {
			e.printStackTrace();
		}
		if (contentType == null || contentType.startsWith("text"))
			return MultiMediaType.others;
		if (contentType.startsWith("image"))
			return MultiMediaType.image;
		if (contentType.startsWith("audio"))
			return MultiMediaType.audio;
		if (contentType.startsWith("video"))
			return MultiMediaType.video;
		
		System.out.println("새로운 국제 표준이 만들어 졌을까요?" + contentType);
		
		return null;
	}
}
