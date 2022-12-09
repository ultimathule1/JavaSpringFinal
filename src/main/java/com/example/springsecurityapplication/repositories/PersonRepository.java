package com.example.springsecurityapplication.repositories;

import com.example.springsecurityapplication.models.Person;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

public interface PersonRepository extends JpaRepository<Person, Integer> {
    // Получаем запись из БД по логину
    Optional<Person> findByLogin(String login);

    //Получение пользователя по email адресу
    Optional<Person> findByEmail(String email);

    //Получение пользователя по номеру тел.
    Optional<Person> findByPhoneNumber(String phone_number);

    //Получение пользователей по фамилии, где первые буквы начинаются с определенной последовательности
    Optional<Person> findByLastnameStartingWith(String starting_with);

}
