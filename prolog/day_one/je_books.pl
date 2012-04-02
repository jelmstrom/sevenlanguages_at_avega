book(lotr,tolkien).
book(hitchikers_guide, adams).
book(patterns,[gamma, vlissides, helm, johnson]).

author(Author, Book) :- book(Book,Author).
