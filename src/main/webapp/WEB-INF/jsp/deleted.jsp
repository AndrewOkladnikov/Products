<label class = "catBtn">Добавить новую категорию </label>
<div>
    <form method="post" action="add-category">
        <input type="text" name="categoryName" placeholder="Категория"/>
        <button type="submit">Добавить</button>
    </form>
</div>
<form method="post" action="/delete-product">
                <td width="5%"><button style = "background-color:#ff6600 ;color:#ffffff" type="submit" >delete</button></td>
                <input id="24" type="text" name="value" value = "<%=prod.getId()%>" hidden>
                <td width="5%"><button value="<%= prod.getPicture()%>" type="button" onclick="openForm(value)">Edit</button></td>
            </form>
<button value="delete" name="hidden" type="submit">Удалить категорию</button><br/>
<div class="form-popup" id="myForm">
      <form action="/update-product" class="form-container">
        <h3>Редактирование товара</h3>
        <label for="name"><b>Название</b></label>
        <input id="tname" type="text" name="name" required><br/>

        <label for="about"><b>Описание</b></label>
        <textarea id="tabout" name="about" required>
        </textarea><br/>

        <label for="1"><b>Производитель</b></label>
        <input id="tmanufacturer" type="text" name="1" required><br/>

        <label for="2"><b>Цена</b></label>
        <input id="tprice" type="text" name="2" value = "" required><br/>

        <label for="3"><b>Дата</b></label>
        <input id="tdate" type="text" name="3" required><br/>

        <label for="4"><b>Категория</b></label>
                <input id="tcategory" type="text" name="4" value = "<%= categoryName%>" required><br/>

        <label for="5"><b>Картинка</b></label>
        <img id="tpict" src="" width="40" height="45">
                <input id="tabout" type="file" name="5" required><br/>

        <button type="submit" class="btn">Отправить</button>
        <button type="button" class="btn cancel" onclick="closeForm()">Закрыть</button>
      </form>
    </div>
    //    @GetMapping("hello")
    //    public String jspMain(Model model) {
    //        System.out.println("In GetMapping(/hello)");
    //        Iterable<Product> messages = productRepository.findAll();
    //        model.addAttribute("messages", messages);
    //        return "main";
    //    }


//    @PostMapping("/update-product")
//    public String updateProduct(@RequestParam String value, Model model) throws IOException {
//        System.out.println("In PostMapping(/update-product)");
//        System.out.println(value);
//        Product product;
//        Integer intId = Integer.parseInt(value);
//        Optional<Product> optionalProduct = productRepository.findById(intId);
//        if (optionalProduct.isPresent()) {
//            product = optionalProduct.get();
//            model.addAttribute("productForView", product);
//        }
//        Iterable<Product> messages = productRepository.findAll();
//        model.addAttribute("idValue", value);
//        model.addAttribute("messages", messages);
//        return "update-jsp";
//    }

@PostMapping("/delete-category")
    public RedirectView deleteCategory(@RequestParam(name = "selected") String categoryName,
                                       Model model) throws IOException {
        //System.out.println("In delete-category");
        if (!Objects.equals(categoryName, "") && categoryName != null) {
            Category category = categoryRepository.findByName(categoryName);
            categoryRepository.deleteById(category.getId());
        }
        return new RedirectView("/");
    }
//    @PostMapping
//    public String filter(@RequestParam(required = false, defaultValue = "") String filter, Model model) {
//        Iterable<Product> messages;
//        if (filter != null && !filter.isEmpty()) {
//            messages = productRepository.findByNameLike("%" + filter + "%");
//        } else {
//            messages = productRepository.findAll();
//        }
//        model.addAttribute("messages", messages);
//        return "main";
//    }

package home.task.controllers;

import home.task.domain.Category;
import home.task.domain.Product;
import home.task.repository.CategoryRepository;
import home.task.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/my-servlet")
public class MyServlet extends HttpServlet {
    @Autowired
    ProductRepository productRepository;
    @Autowired
    CategoryRepository categoryRepository;

    static {
        System.out.println("In myServlet constructor");
    }

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.service(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Iterable<Product> messages = productRepository.findAll();
        Iterable<Category> categories = categoryRepository.findAll();
        req.setAttribute("messages", messages);
        req.setAttribute("categories", categories);
        getServletContext().getRequestDispatcher("/WEB-INF/jsp/main.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}

//    @PostMapping("/edit-product")
//    public String edit(@RequestParam(required = false) String id,
//                       @RequestParam(required = false) String name,
//                       @RequestParam(required = false) String about,
//                       @RequestParam(required = false) String manufacturer,
//                       @RequestParam(name = "picture", required = false) MultipartFile file,
//                       @RequestParam(required = false) Integer price,
//                       @RequestParam(required = false) String createdDate,
//                       @RequestParam(name = "hidden", required = false) String name1,
//                       @RequestParam(name = "selected", required = false) String cat,
//                       Map<String, Object> model) {
//        Iterable<Product> products = productRepository.findAll();
//        Iterable<Category> categories = categoryRepository.findAll();
//        model.put("products", products);
//        model.put("categories", categories);
//        return "add";
//    }


    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/login").setViewName("jsp/testJsp");
    }
implements TomcatContextCustomizer
    @Override
    public void customize(Context context) {
        JspPropertyGroup pg = new JspPropertyGroup();
        pg.addUrlPattern("/*");
        pg.setPageEncoding("UTF-8");
        pg.setTrimWhitespace("true"); // optional, but nice to have
        ArrayList<JspPropertyGroupDescriptor> pgs = new ArrayList<>();
        pgs.add(new JspPropertyGroupDescriptorImpl(pg));
        context.setJspConfigDescriptor(new JspConfigDescriptorImpl(pgs, new ArrayList<TaglibDescriptor>()));
    }

    <%
            for(Product prod:products){
            String categoryName = null;
            String categoryName1 = null;
            Category categoryByStream = null;
            Category testCategory = null;
            if(!(prod.getCategory() == null)){
                categoryName1 = ((Category)categoryRepository.findById(prod.getCategory().getId()).get()).getName();
                categoryByStream = categories.stream().filter(category -> prod.getCategory().getId().equals(category.getId())).findAny().orElse(null);
            }
                for(Category cat:categories){
                    if(!(prod.getCategory() == null) && cat.getId() == prod.getCategory().getId()) categoryName =cat.getName();
                }
                if(!(categoryByStream == null))%> <%= categoryByStream.getName()%><%;%>