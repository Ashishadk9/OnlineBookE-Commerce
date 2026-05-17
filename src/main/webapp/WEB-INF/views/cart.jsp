<%----cart.jsp---%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title> Your Cart UniqueBooks</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/cart.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/header.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/footer.css"/>
    </head>
    <body>
    <%@ include file="/WEB-INF/templates/header.jsp"%>
        <div class="cart-container">
            <h1>Your Shopping Cart</h1>

            <c:if test="${not empty message}">
                <div class="message">${message}</div>
            </c:if>
            <c:if test="${not empty error}">
                <div class="error">${error}</div>
            </c:if>

            <c:choose>
                <c:when test="${empty sessionScope.cart or sessionScope.cart.size()==0}">
                    <p>Your cart is empty. <a href="${pageContext.request.contextPath}/home">Continue shopping</a> </p>
                </c:when>
                <c:otherwise>
                    <table>
                        <tr>
                            <th>Book</th>
                            <th>Author</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                            <th>Action</th>
                        </tr>
                        <c:set var="grandTotal" value="0"/>
                        <c:forEach var="item" items="${sessionScope.cart}">
                            <c:set var="total" value="${item.book.price * item.quantity}"/>
                            <c:set var="grandTotal" value="${grandTotal + total}"/>
                            <tr>
                                <td>${item.book.title}</td>
                                <td>${item.book.author}</td>
                                <td>Rs. ${item.book.price}</td>
                                <td>
                                    <form action="${pageContext.request.contextPath}/cart" method="post" style="display:inline;">
                                        <input type="hidden" name="action" value="update">
                                        <input type="hidden" name="bookId" value="${item.book.id}">
                                        <input type="hidden" name="quantity" value="${item.quantity}" min="0" class="quantity-input" onchange="this.form.submit()">
                                    </form>
                                </td>
                                <td>Rs. ${total}</td>
                                <td>
                                    <form action="${pageContext.request.contextPath}/cart" method="post">
                                    <input type="hidden" name="action" value="remove">
                                        <input type="hidden" name="bookId" value="${item.book.id}">
                                          <button type="submit" class="btn">Remove</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td colspan="4"><strong>Grand Total</strong></td>
                            <td colspan="2"><strong>Rs. ${grandTotal}</strong></td>
                        </tr>
                    </table>
                    <form action="${pageContext.request.contextPath}/checkout" method="post">
                        <button type="submit" class="btn checkout-btn">Proceed to Checkout</button>
                    </form>
                </c:otherwise>
            </c:choose>
                <p><a href="${pageContext.request.contextPath}/home"> Continue Shopping</a> </p>
        </div>
    <%@ include file="/WEB-INF/templates/footer.jsp"%>
    </body>
</html>