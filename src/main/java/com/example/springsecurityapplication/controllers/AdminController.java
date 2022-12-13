package com.example.springsecurityapplication.controllers;

import com.example.springsecurityapplication.models.Image;
import com.example.springsecurityapplication.models.Order;
import com.example.springsecurityapplication.models.Person;
import com.example.springsecurityapplication.models.Product;
import com.example.springsecurityapplication.repositories.CategoryRepository;
import com.example.springsecurityapplication.repositories.OrderRepository;
import com.example.springsecurityapplication.repositories.PersonRepository;
import com.example.springsecurityapplication.security.PersonDetails;
import com.example.springsecurityapplication.services.OrderService;
import com.example.springsecurityapplication.services.PersonService;
import com.example.springsecurityapplication.services.ProductService;
import com.example.springsecurityapplication.util.ProductValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Controller
@RequestMapping("/admin")
//@PreAuthorize("hasAnyAuthority('ROLE_ADMIN')")
public class AdminController {

    @Value("${upload.path}")
    private String uploadPath;

    private final ProductValidator productValidator;
    private final ProductService productService;

    private final CategoryRepository categoryRepository;

    private final PersonService personService;

    private final OrderRepository orderRepository;

    private final OrderService orderService;
    private final PersonRepository personRepository;

    @Autowired
    public AdminController(ProductValidator productValidator, ProductService productService, CategoryRepository categoryRepository, PersonService personService, OrderRepository orderRepository, OrderService orderService,
                           PersonRepository personRepository) {
        this.productValidator = productValidator;
        this.productService = productService;
        this.categoryRepository = categoryRepository;
        this.personService = personService;
        this.orderRepository = orderRepository;
        this.orderService = orderService;
        this.personRepository = personRepository;
    }

    //@PreAuthorize("hasRole('ROLE_ADMIN') and hasRole('')")
    //@PreAuthorize("hasRole('ROLE_ADMIN') or hasRole('')")

    //-----ADMIN PANEL-----\\

    // Метод по отображению главной страницы администратора с выводом товаров
    @GetMapping()
    public String admin(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        PersonDetails personDetails = (PersonDetails) authentication.getPrincipal();

        String role = personDetails.getPerson().getRole();

        if (role.equals("ROLE_USER")) {
            return "redirect:/index";
        }
        model.addAttribute("products", productService.getAllProduct());
        return "admin/admin";
    }

    //------PRODUCTS------\\

    // Метод по отображению формы добавление
    @GetMapping("/product/add")
    public String addProduct(Model model) {
        model.addAttribute("product", new Product());
        model.addAttribute("category", categoryRepository.findAll());
        return "product/addProduct";
    }

    // Метод по добавлению объекта с формы в таблицу product
    @PostMapping("/product/add")
    public String addProduct(@ModelAttribute("product") @Valid Product product, BindingResult bindingResult, @RequestParam("file_one") MultipartFile file_one, @RequestParam("file_two") MultipartFile file_two, @RequestParam("file_three") MultipartFile file_three, @RequestParam("file_four") MultipartFile file_four, @RequestParam("file_five") MultipartFile file_five) throws IOException {

        productValidator.validate(product, bindingResult);
        if (bindingResult.hasErrors()) {
            return "product/addProduct";
        }
        // Проверка на пустоту файла
        if (!file_one.isEmpty()) {
            // Дирректория по сохранению файла
            File uploadDir = new File(uploadPath);
            // Если данной дирректории по пути не сущетсвует
            if (!uploadDir.exists()) {
                // Создаем данную дирректорию
                uploadDir.mkdir();
            }
            // Создаем уникальное имя файла
            // UUID представляет неищменный универсальный уникальный идентификатор
            String uuidFile = UUID.randomUUID().toString();
            // file_one.getOriginalFilename() - наименование файла с формы
            String resultFileName = uuidFile + "." + file_one.getOriginalFilename();
            // Загружаем файл по указаннопу пути
            file_one.transferTo(new File(uploadPath + "/" + resultFileName));
            Image image = new Image();
            image.setProduct(product);
            image.setFileName(resultFileName);
            product.addImageProduct(image);
        }

        // Проверка на пустоту файла
        if (!file_two.isEmpty()) {
            // Дирректория по сохранению файла
            File uploadDir = new File(uploadPath);
            // Если данной дирректории по пути не сущетсвует
            if (!uploadDir.exists()) {
                // Создаем данную дирректорию
                uploadDir.mkdir();
            }
            // Создаем уникальное имя файла
            // UUID представляет неищменный универсальный уникальный идентификатор
            String uuidFile = UUID.randomUUID().toString();
            // file_one.getOriginalFilename() - наименование файла с формы
            String resultFileName = uuidFile + "." + file_two.getOriginalFilename();
            // Загружаем файл по указаннопу пути
            file_two.transferTo(new File(uploadPath + "/" + resultFileName));
            Image image = new Image();
            image.setProduct(product);
            image.setFileName(resultFileName);
            product.addImageProduct(image);
        }

        // Проверка на пустоту файла
        if (!file_three.isEmpty()) {
            // Дирректория по сохранению файла
            File uploadDir = new File(uploadPath);
            // Если данной дирректории по пути не сущетсвует
            if (!uploadDir.exists()) {
                // Создаем данную дирректорию
                uploadDir.mkdir();
            }
            // Создаем уникальное имя файла
            // UUID представляет неищменный универсальный уникальный идентификатор
            String uuidFile = UUID.randomUUID().toString();
            // file_one.getOriginalFilename() - наименование файла с формы
            String resultFileName = uuidFile + "." + file_three.getOriginalFilename();
            // Загружаем файл по указаннопу пути
            file_three.transferTo(new File(uploadPath + "/" + resultFileName));
            Image image = new Image();
            image.setProduct(product);
            image.setFileName(resultFileName);
            product.addImageProduct(image);
        }

        // Проверка на пустоту файла
        if (!file_four.isEmpty()) {
            // Дирректория по сохранению файла
            File uploadDir = new File(uploadPath);
            // Если данной дирректории по пути не сущетсвует
            if (!uploadDir.exists()) {
                // Создаем данную дирректорию
                uploadDir.mkdir();
            }
            // Создаем уникальное имя файла
            // UUID представляет неищменный универсальный уникальный идентификатор
            String uuidFile = UUID.randomUUID().toString();
            // file_one.getOriginalFilename() - наименование файла с формы
            String resultFileName = uuidFile + "." + file_four.getOriginalFilename();
            // Загружаем файл по указаннопу пути
            file_four.transferTo(new File(uploadPath + "/" + resultFileName));
            Image image = new Image();
            image.setProduct(product);
            image.setFileName(resultFileName);
            product.addImageProduct(image);
        }

        // Проверка на пустоту файла
        if (!file_five.isEmpty()) {
            // Дирректория по сохранению файла
            File uploadDir = new File(uploadPath);
            // Если данной дирректории по пути не сущетсвует
            if (!uploadDir.exists()) {
                // Создаем данную дирректорию
                uploadDir.mkdir();
            }
            // Создаем уникальное имя файла
            // UUID представляет неищменный универсальный уникальный идентификатор
            String uuidFile = UUID.randomUUID().toString();
            // file_one.getOriginalFilename() - наименование файла с формы
            String resultFileName = uuidFile + "." + file_five.getOriginalFilename();
            // Загружаем файл по указаннопу пути
            file_five.transferTo(new File(uploadPath + "/" + resultFileName));
            Image image = new Image();
            image.setProduct(product);
            image.setFileName(resultFileName);
            product.addImageProduct(image);
        }

        productService.saveProduct(product);
        return "redirect:/admin";
    }

    //Удаления товара по id
    @GetMapping("/product/delete/{id}")
    public String deleteProduct(@PathVariable("id") int id) {
        productService.deleteProduct(id);
        return "redirect:/admin";
    }

    //Получения товара по id и отображение шаблона редактирования
    @GetMapping("/product/edit/{id}")
    public String editProduct(@PathVariable("id") int id, Model model) {
        model.addAttribute("editProduct", productService.getProductId(id));
        model.addAttribute("category", categoryRepository.findAll());
        return "product/editProduct";
    }

    @PostMapping("/product/edit/{id}")
    public String editProduct(@ModelAttribute("editProduct") Product product, @PathVariable("id") int id) {
        productService.updateProduct(id, product);
        return "redirect:/admin";
    }

    //------ORDERS------\\

    //Страница со всеми заказами
    @GetMapping("/order")
    public String order(Model model) {
        model.addAttribute("orders", orderService.getAllOrder());
        return "orders/order";
    }

    //Поиск заказа по последним символам
    @PostMapping("/order/search")
    public String orderSearch(@RequestParam("search") String search, Model model) {
        model.addAttribute("search_orders", orderRepository.findByNumberContainingIgnoreCase(search));
        model.addAttribute("value_search", search);
        model.addAttribute("orders", orderService.getAllOrder());
        return "orders/order";
    }

    //Отдельный просмотр заказа, а также смена статуса
    @GetMapping("/order/edit/{id}")
    public String editOrder(@PathVariable("id") int id, Model model) {
        model.addAttribute("editOrder", orderService.getOrderById(id));
        return "orders/editOrder";
    }

    //Получение объекта заказа с формы с обновленным статус сохраняем в БД
    @PostMapping("/order/edit/{id}")
    public String editOrder(@ModelAttribute("editOrder") Order order, @PathVariable("id") int id) {
        orderService.updateOrder(id, order);
        return "redirect:/admin/order";
    }

    //------REGISTERED USERS(PERSON)------\\

    //Возвращает страницу с выводом пользователей и кладет объект пользователя в модель
//    @GetMapping("/person")
//    public String person(Model model) {
//        model.addAttribute("person", personService.getAllPerson());
//        return "reguser/person";
//    }

    //Возвращает страницу с выводом пользователей, а также с возможностью изменения роли
    @GetMapping("/person")
    public String person(Model model){
        model.addAttribute("persons", personService.getAllPerson());
        return "reguser/person";
    }

    //Принимает айди пользователя с url, а также роль с формы и сохраняет
    @PostMapping("/person/{id}")
    public String personInfo(@PathVariable("id") int id, @RequestParam("role") String role) {
        Person personRole = personService.getPersonById(id);
        personRole.setRole(role);
        personRepository.save(personRole);
        return "redirect:/admin/person";
    }

    //Страница с подробной информацией о пользователе
    @GetMapping("/person/info/{id}")
    public String infoPerson(@PathVariable int id, Model model) {
        model.addAttribute("person", personService.getPersonById(id));
        return "reguser/personInfo";
    }

//    //Страница с формой редактирования пользователя, а в модель помещается объект редактируемого пользователя
//    @GetMapping("/person/edit/{id}")
//    public String editPerson(@PathVariable("id")int id, Model model){
//        model.addAttribute("editPerson", personService.getPersonById(id));
//        return "reguser/editPerson";
//    }
//
//    //Принимает объект с формы и обновляет пользователя
//    @PostMapping("/person/edit/{id}")
//    public String editPerson(@ModelAttribute("editPerson") @Valid Person person, BindingResult bindingResult, @PathVariable("id") int id){
//        if(bindingResult.hasErrors()){
//            System.out.println("Произошла ошибочка");
//            return "reguser/editPerson";
//        }
//        personService.updatePerson(id, person);
//        return "redirect:/admin/person";
//    }

    //Удаление пользователя по id
    @GetMapping("/person/delete/{id}")
    public String deletePerson(@PathVariable("id") int id) {
        personService.deletePerson(id);
        return "redirect:/admin/person";
    }

    //При нажатии на кнопку будет происходить поиск, сортировка и отображение шаблона
//    @GetMapping("/person/sorting_and_searching_and_filters")
//    public String sorting_and_searching_and_filters() {
//        return "/reguser/SortingAndSearchingAndFilters";
//    }
//
//    @PostMapping("/person/sorting_and_searching_and_filters")
//    public String sorting_and_searching_and_filters(@RequestParam("SortingAndSearchingAndFiltersOptions")
//                                                    String sortingAndSearchingAndFiltersOptions, @RequestParam("value") String value, Model model){
//        switch (sortingAndSearchingAndFiltersOptions) {
//            case "last_name_start" -> model.addAttribute("person", personService.getPersonLastNameStartingWith(value));
//            case "email" -> model.addAttribute("person", personService.getPersonEmail(value));
//            case "phone_number" -> model.addAttribute("person", personService.getPersonPhoneNumber(value));
//        }
//        return "reguser/SortingAndSearchingAndFilters";
//    }
}