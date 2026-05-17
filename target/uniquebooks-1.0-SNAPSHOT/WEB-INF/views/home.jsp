<%----home.jsp---%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover"/>
        <title>UniqueBook Hand-picked Books</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/header.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/header.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/footer.css"/>
    </head>
    <body>
        <div class="container">
            <%@ include file="/WEB-INF/templates/header.jsp" %>

            <div class="welcome">
                <h2>Welcome to UniqueBook</h2>
                <p>A small, hand-picked collection of books. Clam reading. Clear prices.</p>
                <a href="#" class="explore-btn">Explore collection</a>
            </div>

            <div class="featured-title">Featured Books</div>

            <!--Search Bar-->
            <div class="search-container">
                <div class="search-wrapper">
                    <input type="text" id="searchInput" class="search-input" placeholder="Search a books by title.." onkeyup="filterBooks()"/>
                    <span class="search-icon"> </span>
                </div>
            </div>

            <div id="noResults" class="no-results"> 😔No matching books not found. </div>

            <div class="books-grid" id="booksGrid">
    <!--Book 1-->
    <div class="book-card">
        <img class="book-image" src="${pageContext.request.contextPath}/static/images/book1.jpg" alt="Think and Grow Rich"/>
        <div class="book-title">Think and Grow Rich</div>
        <div class="book-author">Napoleon Hill</div>
        <div class="price"><span class="old-price">Rs. 3,350</span> <span class="new-price">Rs. 2,350</span></div>
        <form action="${pageContext.request.contextPath}/cart" method="post">
            <input type="hidden" name="action" value="add"/>
            <input type="hidden" name="bookId" value="1"/>
            <button class="add-to-cart-btn"> Add to Cart</button>
        </form>
    </div>
    <!--Book 2-->
    <div class="book-card">
        <img class="book-image" src="${pageContext.request.contextPath}/static/images/book2.jpg" alt="The Odyssey"/>
        <div class="book-title">The Odyssey</div>
        <div class="book-author">Emily Wilson</div>
        <div class="price"><span class="old-price">Rs. 2,100</span> <span class="new-price">Rs. 990</span></div>
        <form action="${pageContext.request.contextPath}/cart" method="post">
            <input type="hidden" name="action" value="add"/>
            <input type="hidden" name="bookId" value="2"/>
            <button class="add-to-cart-btn"> Add to Cart</button>
        </form>
    </div>
    <!--Book 3-->
    <div class="book-card">
        <img class="book-image" src="${pageContext.request.contextPath}/static/images/book3.jpg" alt="Atomic Habits"/>
        <div class="book-title">Atomic Habits</div>
        <div class="book-author">James Clear</div>
        <div class="price"><span class="old-price">Rs. 2,000</span> <span class="new-price">Rs. 1,690</span></div>
        <form action="${pageContext.request.contextPath}/cart" method="post">
            <input type="hidden" name="action" value="add"/>
            <input type="hidden" name="bookId" value="3"/>
            <button class="add-to-cart-btn"> Add to Cart</button>
        </form>
    </div>
    <!--Book 4-->
    <div class="book-card">
        <img class="book-image" src="${pageContext.request.contextPath}/static/images/book4.jpg" alt="Fundamentals of Data Engineering"/>
        <div class="book-title">Fundamentals of Data Engineering</div>
        <div class="book-author">Matt Housley</div>
        <div class="price"><span class="old-price">Rs. 3,000</span> <span class="new-price">Rs. 2,490</span></div>
        <form action="${pageContext.request.contextPath}/cart" method="post">
            <input type="hidden" name="action" value="add"/>
            <input type="hidden" name="bookId" value="4"/>
            <button class="add-to-cart-btn"> Add to Cart</button>
        </form>
    </div>
    <!--Book 5-->
    <div class="book-card">
        <img class="book-image" src="${pageContext.request.contextPath}/static/images/book5.jpg" alt="The Correspondent"/>
        <div class="book-title">The Correspondent</div>
        <div class="book-author">Virginia Evans</div>
        <div class="price"><span class="old-price">Rs. 2,000</span> <span class="new-price">Rs. 1,390</span></div>
        <form action="${pageContext.request.contextPath}/cart" method="post">
            <input type="hidden" name="action" value="add"/>
            <input type="hidden" name="bookId" value="5"/>
            <button class="add-to-cart-btn"> Add to Cart</button>
        </form>
    </div>
    <!--Book 6-->
    <div class="book-card">
        <img class="book-image" src="${pageContext.request.contextPath}/static/images/book6.jpg" alt="History Matters"/>
        <div class="book-title">History Matters</div>
        <div class="book-author">David McCullough</div>
        <div class="price"><span class="old-price">Rs. 3,000</span> <span class="new-price">Rs. 2,150</span></div>
        <form action="${pageContext.request.contextPath}/cart" method="post">
            <input type="hidden" name="action" value="add"/>
            <input type="hidden" name="bookId" value="6"/>
            <button class="add-to-cart-btn"> Add to Cart</button>
        </form>
    </div>
    <!--Book 7-->
    <div class="book-card">
        <img class="book-image" src="${pageContext.request.contextPath}/static/images/book7.jpg" alt="The Second World War"/>
        <div class="book-title">The Second World War</div>
        <div class="book-author">Antony Beevor</div>
        <div class="price"><span class="old-price">Rs. 2,000</span> <span class="new-price">Rs. 1,450</span></div>
        <form action="${pageContext.request.contextPath}/cart" method="post">
            <input type="hidden" name="action" value="add"/>
            <input type="hidden" name="bookId" value="7"/>
            <button class="add-to-cart-btn"> Add to Cart</button>
        </form>
    </div>
    <!--Book 8-->
    <div class="book-card">
        <img class="book-image" src="${pageContext.request.contextPath}/static/images/book8.jpg" alt="Project Hail Mary"/>
        <div class="book-title">Project Hail Mary</div>
        <div class="book-author">Andy Weir</div>
        <div class="price"><span class="old-price">Rs. 2,000</span> <span class="new-price">Rs. 1,190</span></div>
        <form action="${pageContext.request.contextPath}/cart" method="post">
            <input type="hidden" name="action" value="add"/>
            <input type="hidden" name="bookId" value="8"/>
            <button class="add-to-cart-btn"> Add to Cart</button>
        </form>
    </div>
    <!--Book 9-->
    <div class="book-card">
        <img class="book-image" src="${pageContext.request.contextPath}/static/images/book9.jpg" alt="Red Rising"/>
        <div class="book-title">Red Rising</div>
        <div class="book-author">Pierce Brown</div>
        <div class="price"><span class="old-price">Rs. 2,100</span> <span class="new-price">Rs. 1,550</span></div>
        <form action="${pageContext.request.contextPath}/cart" method="post">
            <input type="hidden" name="action" value="add"/>
            <input type="hidden" name="bookId" value="9"/>
            <button class="add-to-cart-btn"> Add to Cart</button>
        </form>
    </div>
    <!--Book 10-->
    <div class="book-card">
        <img class="book-image" src="${pageContext.request.contextPath}/static/images/book10.jpg" alt="Ting Css Projects"/>
        <div class="book-title">Ting Css Projects</div>
        <div class="book-author">M. Dowden</div>
        <div class="price"><span class="old-price">Rs. 2,500</span> <span class="new-price">Rs. 1,850</span></div>
        <form action="${pageContext.request.contextPath}/cart" method="post">
            <input type="hidden" name="action" value="add"/>
            <input type="hidden" name="bookId" value="10"/>
            <button class="add-to-cart-btn"> Add to Cart</button>
        </form>
    </div>
</div>

       <!--Footer-->
      <%@ include file="/WEB-INF/templates/footer.jsp"%>
</div>
    <script>
        const searchInput = document.getElementById('searchInput');
        const booksGrid = document.getElementById('booksGrid');
        const noResultsDiv = document.getElementById('noResults');
        const bookCards = Array.from(document.querySelectorAll('.book-card'));

        function filterBooks() {
            const query = searchInput.value.trim().toLowerCase();
            let hasVisible = false;
            bookCards.forEach(card => {
                const title = card.getAttribute('data-title').toLowerCase();
                const author = card.getAttribute('data-author').toLowerCase();

                if (title.includes(query) || author.includes(query)) {
                    card.style.display='';
                    hasVisible = true;
                } else {
                    card.style.display='none';
                    }
            });
            noResultsDiv.style.display = hasVisible ? 'none' : 'block';
        }
        searchInput.addEventListener('input', filterBooks);
    </script>
  </body>
</html>