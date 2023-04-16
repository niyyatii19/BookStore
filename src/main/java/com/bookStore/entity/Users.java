package com.bookStore.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@Data
@NoArgsConstructor
@ToString(exclude = { "likedBooks", "readLater" })
public class Users {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	@Column(unique = true)
	private String email;
	private String password; 
	private String role;
	@ManyToMany
	@JoinTable(name = "books_like", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "book_id"))
	List<Books> likedBooks;

	public void add(Books book) {
		if (book != null) {
			if (likedBooks == null) {
				likedBooks = new ArrayList<>();
			}
			if (!likedBooks.contains(book)) {
				likedBooks.add(book);
				book.add(this);
			}
		}
	}

	@ManyToMany
	@JoinTable(name = "read_later", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "book_id"))
	List<Books> readLater;

	public void addBooks(Books book) {
		if (book != null) {
			if (readLater == null) {
				readLater = new ArrayList<>();
			}
			if (!readLater.contains(book)) {
				readLater.add(book);
				book.addBooks(this);
			}
		}
	}

}
