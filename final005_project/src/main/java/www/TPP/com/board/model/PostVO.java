package www.TPP.com.board.model;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;
import www.TPP.com.common.model.CommonAttr;

@Data
@NoArgsConstructor
public class PostVO extends CommonAttr{
	private static final String UPLOAD_FOLDER = "C:\\savedImages";
	
	private String postId;	
	private String postTitle;
	private double rateScore;
	private double rateCount;
	private String sellCount;
	private String image;
	
	private String sellerId;
	
	public PostVO(String sellerId, File image) {
		File uploadPath = new File(UPLOAD_FOLDER, getFolderName(sellerId));
		if (!uploadPath.exists()) {
			uploadPath.mkdirs();
		}
		
		try {
			Files.copy(image.toPath(), uploadPath.toPath(), StandardCopyOption.REPLACE_EXISTING);
		} catch (IOException e) {
			e.printStackTrace();
		}
		this.sellerId = sellerId;
		this.image = uploadPath.getAbsolutePath();
	}
	
	private String getFolderName(String sellerId) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-" + sellerId);
		return sdf.format(new Date()).replace('-', File.separatorChar);
	}
	
}
