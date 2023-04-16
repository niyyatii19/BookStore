package com.bookStore.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class BookAuthor {
	private String title;
	private String name;
	private String description;
	private String country;
	private double price;
	private String url;
}
