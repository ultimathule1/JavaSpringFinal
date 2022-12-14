package com.example.springsecurityapplication.services;

import com.example.springsecurityapplication.models.Person;
import com.example.springsecurityapplication.repositories.PersonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@Transactional(readOnly = true)
public class PersonService {
    private final PersonRepository personRepository;

    private final PasswordEncoder passwordEncoder;

    @Autowired
    public PersonService(PersonRepository personRepository, PasswordEncoder passwordEncoder) {
        this.personRepository = personRepository;
        this.passwordEncoder = passwordEncoder;
    }

    //Получение пользователя по логину
    public Person getPersonFindByLogin(Person person){
        Optional<Person> person_db = personRepository.findByLogin(person.getLogin());
        return person_db.orElse(null);
    }

    //Происходит регистрация, где по умолчанию выдается роль ROLE_USER
    //А так же происходит сохранение пароля в захешированном виде
    @Transactional
    public void register(Person person){
        person.setPassword(passwordEncoder.encode(person.getPassword()));
        person.setRole("ROLE_USER");
        personRepository.save(person);
    }

    //Получение всех пользователей
    public List<Person> getAllPerson(){
        return personRepository.findAll();
    }

    //Получить пользователя по id
    public Person getPersonById(int id) {
        Optional<Person> optionalPerson = personRepository.findById(id);
        return optionalPerson.orElse(null);
    }

    //Обновление данных пользователя
    @Transactional
    public void updatePerson(int id, Person person) {
        person.setId(id);
        personRepository.save(person);
    }

    //Удаление пользователя по id
    @Transactional
    public void deletePerson(int id) {
        personRepository.deleteById(id);
    }

    //Получение пользователя по email
    public Person getPersonEmail(String email) {
        Optional<Person> optionalPerson = personRepository.findByEmail(email);
        return optionalPerson.orElse(null);
    }

    //Получение пользователя по номеру тел.
    public Person getPersonPhoneNumber(String phone_number){
        Optional<Person> optionalPersons = personRepository.findByPhoneNumber(phone_number);
        return optionalPersons.orElse(null);
    }

    //Получение пользователя по фамилии, где начало помещается в параметр starting_with
    public Person getPersonLastNameStartingWith(String starting_with){
        Optional<Person> optionalPersons = personRepository.findByLastnameStartingWith(starting_with);
        return optionalPersons.orElse(null);
    }
}
