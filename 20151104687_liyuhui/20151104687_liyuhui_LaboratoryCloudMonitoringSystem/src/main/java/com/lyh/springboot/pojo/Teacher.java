package com.lyh.springboot.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Teacher {
	private Integer id;
	private String name;
	private String num;
	private String tel;
	private String email;
}
