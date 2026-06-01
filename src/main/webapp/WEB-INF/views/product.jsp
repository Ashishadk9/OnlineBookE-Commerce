<%----product.jsp---%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover"/>
        <title>All Books UniqueBooks</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/header.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/footer.css"/>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }
            body{
                font-family: sans-serif;
                background: #faf9f8;
                color: #1a2a3a;
            }
            .container{
                max-width: 1200px;
                margin: 0 auto;
                padding: 1rem 2rem;
            }

            .page-header{
                text-align: center;
                margin:2rem 0 1rem;
            }
            .page-header h1{
            font-size: 2rem;
            color: #0f172a;
            }
            .page-header p{
                color: #475569;
                margin-top: 0.3rem;
            }
            /* Search bar styles*/
            .search-container{
                display: flex;
                justify-content: center;
                margin: 1.5rem 0 2rem;
            }

            .search-wrapper{
                position: relative;
                width: 100%;
                max-width: 400px;
            }
            .search-input{
                width: 100%;
                padding: 12px 45px 12px 20px;
                font-size:1rem;
                border:2px solid #3b82f6;
                border-radius: 50px;
                outline: none;
                transition: all 0.2s;
                background: white;
            }
            .search-input:focus{
                border-color: #3e5dc8;
                box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.2);
            }
            .no-results{
                text-align: center;
                padding: 2rem;
                color: #6b7280;
                display: none;
            }
            .books-grid {
            display: grid;
                grid-template-columns: repeat(auto-fill,minmax(250px,1fr));
                gap: 2rem;
            margin: 2rem 0;
            }
            .book-card {
                background: white;
                border-radius: 20px;
                overflow: hidden;
                box-shadow: 0 4px 12px rgba(0, 0, 0,0.05);
                text-align: center;
                padding-bottom: 1rem;
                transition: 0.2s;
            }
            .book-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 12px 24px rgba(0, 0, 0,0.01);
            }
            .book-image {
                width: 100%;
                height: 260px;
                object-fit: cover;
                background: #f1f5f9;
            }
            .data-title {
                font-size: 1.2rem;
                font-weight: 600;
                margin: 0.8rem 0 0.2rem;
            }
            .data-author {
                color: #64748b;
                font-size: 0.9rem;
                margin-bottom: 0.3rem;
            }

            .price {
                margin: 0.5rem 0;
            }
            .old-price {
                text-decoration: line-through;
                color: #94a3b8;
                font-size: 0.85rem;
                margin-right: 0.6rem;
            }
            .new-price {
                font-size: 1.3rem;
                font-weight: 700;
                color: #0f172a;
            }
            .add-to-cart-btn {
                background: #0f172a;
                color: white;
                border: none;
                padding: 8px 12px;
                border-radius: 30px;
                cursor: pointer;
                width: calc(100% - 30px);
                margin: 5px 15px 10px;
                font-weight: 500;
                transition: background 0.2s;
            }
            .add-to-cart-btn:hover {
                background: #1e293b;
            }

            @media(max-width:768px) {
                .container{
                    padding: 0.8rem 1rem;
                }
                .books-grid{
                    gap:1rem;
                }
                .book-image{
                    height: 200px;
                }
            }
        </style>
    </head>
    <body>
        <div class="container">
            <%@ include file="/WEB-INF/templates/header.jsp" %>

            <!--Search Bar-->
            <div class="search-container">
                <div class="search-wrapper">
                    <input type="text" id="searchInput" class="search-input" placeholder="Search a books.." onkeyup="filterBooks()"/>
                    <span class="search-icon"> </span>
                </div>
            </div>

         <div class="page-header">
            <h1> Featured Books</h1>
            <p> Browse our collection of unique book.</p>
         </div>

            <div id="noResults" class="no-results"> 😔No matching books not found. </div>

            <div class="books-grid" id="booksGrid">
                <!--Book 1-->
                <div class="book-card">
                    <img class="book-image" src="${pageContext.request.contextPath}/static/images/book1.jpg" alt="Think and Grow Rich"/>
                    <div class="data-title">Think and Grow Rich</div>
                    <div class="data-author">Napoleon Hill</div>
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
                    <div class="data-title">The Odyssey</div>
                    <div class="data-author">Emily Wilson</div>
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
                    <div class="data-title">Atomic Habits</div>
                    <div class="data-author">James Clear</div>
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
                    <div class="data-title">Fundamentals of Data Engineering</div>
                    <div class="data-author">Matt Housley</div>
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
                    <div class="data-title">The Correspondent</div>
                    <div class="data-author">Virginia Evans</div>
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
                    <div class="data-title">History Matters</div>
                    <div class="data-author">David McCullough</div>
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
                    <div class="data-title">The Second World War</div>
                    <div class="data-author">Antony Beevor</div>
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
                    <div class="data-title">Project Hail Mary</div>
                    <div class="data-author">Andy Weir</div>
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
                    <div class="data-title">Red Rising</div>
                    <div class="data-author">Pierce Brown</div>
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
                    <div class="data-title">Ting Css Projects</div>
                    <div class="data-author">M. Dowden</div>
                    <div class="price"><span class="old-price">Rs. 2,500</span> <span class="new-price">Rs. 1,850</span></div>
                    <form action="${pageContext.request.contextPath}/cart" method="post">
                        <input type="hidden" name="action" value="add"/>
                        <input type="hidden" name="bookId" value="10"/>
                        <button class="add-to-cart-btn"> Add to Cart</button>
                    </form>
                </div>
            </div>
        </div>
        <script>
            function filterBooks(){
                let input = document.getElementById('searchInput');
                let filter = input.value.trim().toLowerCase();
                let grid=document.getElementById('booksGrid');
                let cards = grid.getElementsByClassName('book-card');
                let noResults=document.getElementById('noResults');
                let visibleCount=0;

                for (let i = 0; i < cards.length; i++) {
                    let titleDiv = cards[i].querySelector('.data-title');
                    let authorDiv = cards[i].querySelector('.data-author');
                    let title = titleDiv ? titleDiv.innerText.toLowerCase() : '';
                    let author = authorDiv ? authorDiv.innerText.toLowerCase() : '';

                    if (title.includes(filter) || author.includes(filter)) {
                        cards[i].style.display= '';
                        visibleCount++;
                    }else{
                        cards[i].style.display='none';
                }
                    }
                noResults.style.display= visibleCount === 0 ? 'block' : 'none';
                }
        </script>
        <!--Footer-->
        <%@ include file="/WEB-INF/templates/footer.jsp"%>
    </body>
</html>
