create database bookStore;
use bookStore;

-- drop table booksauthors;
-- drop table books;
-- drop table authors;


CREATE TABLE Authors (
    Id INT NOT NULL AUTO_INCREMENT,
    Name VARCHAR(70) NOT NULL,
    Country VARCHAR(100) NOT NULL,
    PRIMARY KEY(Id)
);

INSERT INTO Authors
    (Name, Country)
VALUES
    ('J.D. Salinger', 'USA'),
    ('F. Scott. Fitzgerald', 'USA'),
    ('Jane Austen', 'UK'),
    ('Scott Hanselman', 'USA'),
    ('Jason N. Gaylord', 'USA'),
    ('Pranav Rastogi', 'India'),
    ('Todd Miranda', 'USA'),
    ('Christian Wenz', 'USA')
;

CREATE TABLE Books (
    Id INT NOT NULL AUTO_INCREMENT,
    Title VARCHAR(50) NOT NULL,
    url  VARCHAR(255),
    description varchar(500),
    PRIMARY KEY(Id)
);



CREATE TABLE BooksAuthors (
    AuthorId INT NOT NULL,
    BookId  INT NOT NULL,
    FOREIGN KEY (AuthorId) REFERENCES Authors(Id),
    FOREIGN KEY (BookId) REFERENCES Books(Id)
);

INSERT INTO Books
    (Id, Title, url, description)
VALUES
    (1, 'The Catcher in the Rye', "/images/book1.jpg", 'The Catcher in the Rye describes the adventures of well-off teenage boy Holden Caulfield on a weekend out alone in New York City, illuminating the struggles of young adults with existential questions of morality, identity, meaning, and connection.'),
    (2, 'Nine Stories', "/images/book2.jpg", 'Nine Stories (1953) is a collection of short stories by American fiction writer J. D. Salinger published in April 1953. It includes two of his most famous short stories, "A Perfect Day for Bananafish" and "For Esmé – with Love and Squalor". (Nine Stories is the U.S. title; the book is published in many other countries as For Esmé - with Love and Squalor, and Other Stories.)'),
    (3, 'Franny and Zooey', "/images/book3.jpg", 'Franny tells the story of Franny Glass, Zooey\'s sister, a college student. The story takes place in an unnamed college town during Franny\'s weekend visit to her boyfriend Lane. Disenchanted with the selfishness and inauthenticity she perceives all around her, she aims to escape it through spiritual means.'),
    (4, 'The Great Gatsby', "/images/book4.jpg", 'Scott Fitzgerald\'s novel,The Great Gatsby, follows Jay Gatsby, a man who orders his life around one desire: to be reunited with Daisy Buchanan, the love he lost five years earlier. Gatsby\'s quest leads him from poverty to wealth, into the arms of his beloved, and eventually to death.'),
    (5, 'Tender id the Night', "/images/book5.jpg", 'Tender Is the Night, semiautobiographical novel by F. Scott Fitzgerald, published in 1934. It is the story of a psychiatrist who marries one of his patients; as she slowly recovers, she exhausts his vitality until he is, in Fitzgerald\'s words, un homme épuisé (“a used-up man”).'),
    (6, 'Pride and Prejudice', "/images/book6.jpg", 'Pride and Prejudice follows the turbulent relationship between Elizabeth Bennet, the daughter of a country gentleman, and Fitzwilliam Darcy, a rich aristocratic landowner. They must overcome the titular sins of pride and prejudice in order to fall in love and marry.'),
    (7, 'Professional ASP.NET 4.5 in C# and VB', "/images/book7.jpg", 'ASP.NET is Microsoft′s technology for building dynamically generated web pages from database content. Originally introduced in 2002, ASP.NET has undergone many changes in multiple versions and iterations as developers have gained a decade of experience with this popular technology. With that decade of experience, this edition of the book presents a fresh, new overhauled approach.')
;
INSERT INTO BooksAuthors
    (BookId, AuthorId)
VALUES
    (1, 1),
    (2, 1),
    (3, 1),
    (4, 2),
    (5, 2),
    (6, 3),
    (7, 4),
    (7, 5),
    (7, 6),
    (7, 7),
    (7, 8)
;

create Table Users(
id int auto_increment primary key,
name varchar(255),
email varchar(255) unique,
password varchar(255),
role varchar(255)
);


CREATE TABLE read_later (
    user_id INT NOT NULL,
    book_id  INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(id),
    FOREIGN KEY (book_id) REFERENCES Books(id)
);

CREATE TABLE books_like (
    user_id INT NOT NULL,
    book_id  INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(id),
    FOREIGN KEY (book_id) REFERENCES Books(id)
);


