package com.lyh.springboot.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Login {
	private Integer id;
    private String  num;
    private String  pwd;
    private Integer u_type;
    
}
