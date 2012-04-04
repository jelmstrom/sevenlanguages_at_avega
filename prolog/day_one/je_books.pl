book(lotr,tolkien).
book(hitchikers_guide, adams).
book(patterns, johnson).
book(patterns, helm).
book(patterns, vlissides).
book(patterns, gamma).

author(Author, Book) :- book(Book,Author).
