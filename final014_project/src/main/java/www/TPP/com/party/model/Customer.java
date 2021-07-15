package www.TPP.com.party.model;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Customer extends Party{
	
	public Customer(String userId) {
		super(userId);
	}
}
