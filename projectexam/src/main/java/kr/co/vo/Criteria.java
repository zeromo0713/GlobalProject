package kr.co.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString //출력하기 위해서 필요
public class Criteria { //페이징에 관련된 것이 스프링부트에서는 Criteria라고 부른다
	private int pageNum;
	private int amount;
	
	private String type;
	private String keyword;
	
	public Criteria() {
		this(1,10);
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	public String[] getTypeArr() {
		return type == null? new String[] {}: type.split(""); //타입이 null이면 빈 배열 반환, null이 아니면 split("")로 반환
		
	}
}