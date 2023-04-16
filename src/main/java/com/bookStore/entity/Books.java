package com.bookStore.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@Data
@NoArgsConstructor
@ToString(exclude = { "likes", "later", "author" })
public class Books {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String title;
	private String url;
	private String description;
	private double price;
	@ManyToOne
	@JoinColumn(name = "authorid")
	@OnDelete(action = OnDeleteAction.CASCADE)
	private Authors author;

	@ManyToMany(mappedBy = "likedBooks")
	List<Users> likes;

	public void add(Users user) {
		if (user != null) {
			if (likes == null) {
				likes = new ArrayList<>();
			}
			if (!likes.contains(user))
				likes.add(user);
		}
	}

	@ManyToMany(mappedBy = "readLater")
	List<Users> later;

	public void addBooks(Users user) {
		if (user != null) {
			if (later == null) {
				later = new ArrayList<>();
			}
			if (!later.contains(user))
				later.add(user);
		}
	}

}
