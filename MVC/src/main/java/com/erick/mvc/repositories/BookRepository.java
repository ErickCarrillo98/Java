package com.erick.mvc.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.erick.mvc.models.Book;
					


@Repository															//our model, id type
public interface BookRepository extends CrudRepository<Book, Long> {
	List<Book> findAll();

	Book save(long id);
	
	Optional<Book>findById(long id);
}
