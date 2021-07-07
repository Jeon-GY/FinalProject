package www.TPP.com.board.model;

import lombok.Data;
import lombok.NoArgsConstructor;
import www.TPP.com.common.model.CommonAttr;

@Data
@NoArgsConstructor
public class PostInfoVO extends CommonAttr{
	private String postInfoId;
    private String postInfoName;
    private String postInfoContent;
    
}
