package com.bookStore.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@Data
@NoArgsConstructor
@ToString(exclude = { "books" })
public class Authors {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	private String country;

	@OneToMany(mappedBy = "author")
	List<Books> books;

	public void add(Books book) {
		if(book != null) {
			if(this.books == null) {
				this.books = new ArrayList<>();
			}
			this.books.add(book);
			book.setAuthor(this);
		}
	}
}
