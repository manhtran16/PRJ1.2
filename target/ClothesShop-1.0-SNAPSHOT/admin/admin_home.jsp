<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <title>Admin Home</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mdb.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"/>
    <style>
        body {
            font-family: 'Roboto', Arial, sans-serif;
            background: linear-gradient(120deg, #f6d365 0%, #a770ef 100%);
            margin: 0;
            padding: 0;
            min-height: 100vh;
        }

        .admin-header {
            background: linear-gradient(90deg, #a770ef 0%, #f6d365 100%);
            color: #fff;
            text-align: center;
            padding: 2rem 0 1.2rem 0;
            margin: 0;
            font-size: 2.2rem;
            font-weight: 700;
            letter-spacing: 2px;
            border-radius: 0 0 24px 24px;
            box-shadow: 0 4px 24px rgba(167,112,239,0.2);
            position: relative;
        }

        .admin-header .fa-user-shield {
            margin-right: 12px;
            font-size: 2.2rem;
            vertical-align: middle;
        }

        .logout-btn {
            position: absolute;
            top: 1rem;
            right: 1rem;
            background: rgba(255,255,255,0.2);
            border: none;
            color: white;
            padding: 0.5rem 1rem;
            border-radius: 20px;
            cursor: pointer;
            font-size: 0.9rem;
            display: flex;
            align-items: center;
            transition: all 0.2s;
        }

        .logout-btn:hover {
            background: rgba(255,255,255,0.3);
        }

        .menu-section {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 1rem;
            margin-top: 2rem;
            width: 100%;
        }

        .menu-form-wrapper {
            background: #fff;
            border-radius: 18px;
            box-shadow: 0 6px 32px rgba(167,112,239,0.10);
            padding: 2.2rem 2rem 1.5rem 2rem;
            margin: 2.5rem auto 1.5rem auto;
            max-width: 480px;
            width: 100%;
        }

        .menu-form {
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 1rem;
            max-width: 420px;
            margin: 0 auto;
        }

        .menu-item {
            display: flex;
            align-items: center;
            text-decoration: none;
            font-size: 1.15rem;
            color: #fff;
            background: linear-gradient(90deg, #a770ef 0%, #f6d365 100%);
            padding: 1rem 1.75rem;
            border-radius: 10px;
            font-weight: 500;
            box-shadow: 0 4px 12px rgba(167,112,239,0.15);
            transition: all 0.3s ease;
            width: 100%;
            min-width: 220px;
            max-width: 420px;
            justify-content: flex-start;
            box-sizing: border-box;
        }

        .menu-item:hover {
            background: linear-gradient(90deg, #f6d365 0%, #a770ef 100%);
            transform: translateY(-3px);
            box-shadow: 0 6px 18px rgba(167,112,239,0.25);
        }

        .menu-item i {
            margin-right: 14px;
            font-size: 1.2rem;
        }

        .stats-container {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 1rem;
            margin: 2rem auto 1rem auto;
            max-width: 700px;
        }

        .stat-card {
            background: rgba(255, 255, 255, 0.9);
            border-radius: 12px;
            padding: 1rem;
            text-align: center;
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
            transition: transform 0.2s;
        }

        .stat-card:hover {
            transform: translateY(-5px);
        }

        .stat-value {
            font-size: 1.8rem;
            font-weight: 700;
            color: #a770ef;
            margin: 0.5rem 0;
        }

        .stat-label {
            color: #666;
            font-size: 0.9rem;
        }

        .recent-activity {
            max-width: 700px;
            margin: 2rem auto;
            background: #f9f9f9;
            padding: 1.5rem;
            border-radius: 1rem;
        }

        .recent-activity h3 {
            font-size: 1.1rem;
            font-weight: 600;
            color: #444;
            margin-bottom: 1rem;
        }

        .recent-activity .entry {
            display: flex;
            align-items: center;
            font-size: 0.95rem;
            margin-bottom: 0.75rem;
        }

        .recent-activity .entry .dot {
            width: 8px;
            height: 8px;
            border-radius: 50%;
            margin-right: 10px;
        }

        .recent-activity .entry span {
            color: #555;
        }

        .recent-activity .entry .time {
            margin-left: auto;
            font-size: 0.75rem;
            color: #999;
        }

        @media (max-width: 640px) {
            .admin-header {
                font-size: 1.5rem;
                padding: 1.5rem 0 1rem 0;
            }

            .stats-container {
                grid-template-columns: 1fr;
                padding: 0 1rem;
            }

            .logout-btn {
                top: 0.7rem;
                right: 0.7rem;
                padding: 0.3rem 0.7rem;
                font-size: 0.8rem;
            }

            .menu-item {
                font-size: 1rem;
                padding: 0.8rem 1.2rem;
            }

            .recent-activity {
                margin: 1rem;
                padding: 1rem;
            }

            .menu-form, .menu-item {
                max-width: 98vw;
                min-width: unset;
            }

            .menu-form-wrapper {
                padding: 1.2rem 0.5rem 1rem 0.5rem;
                max-width: 99vw;
            }
        }
    </style>
</head>
<body>
    <div class="admin-header">
        <i class="fas fa-user-shield"></i> ADMIN DASHBOARD
        <button class="logout-btn"><i class="fas fa-sign-out-alt"></i>&nbsp; Logout</button>
    </div>

    <div class="menu-section">
        <div class="menu-form-wrapper">
            <form class="menu-form">
                <a href="../index.jsp" class="menu-item"><i class="fas fa-home"></i> User Home</a>
                <a href="${pageContext.request.contextPath}/productmanagement" class="menu-item"><i class="fas fa-box"></i> Product Management</a>
                <a href="${pageContext.request.contextPath}/brandmanagement" class="menu-item"><i class="fas fa-tags"></i> Brand Management</a>
                <a href="${pageContext.request.contextPath}/typemanagement" class="menu-item"><i class="fas fa-list"></i> Type Management</a>
                <a href="#" class="menu-item"><i class="fas fa-chart-bar"></i> Statistics</a>
            </form>
        </div>
    </div>

    <div class="stats-container">
        <div class="stat-card">
            <i class="fas fa-shopping-cart text-purple-500 text-2xl"></i>
            <div class="stat-value">
                <c:out value="${totalOrders}" default="0"/>
            </div>
            <div class="stat-label">Total Orders</div>
        </div>
        <div class="stat-card">
            <i class="fas fa-box-open text-yellow-500 text-2xl"></i>
            <div class="stat-value">
                <c:out value="${totalProducts}" default="0"/>
            </div>
            <div class="stat-label">Products</div>
        </div>
        <div class="stat-card">
            <i class="fas fa-users text-blue-500 text-2xl"></i>
            <div class="stat-value">
                <c:out value="${totalCustomers}" default="0"/>
            </div>
            <div class="stat-label">Customers</div>
        </div>
        <div class="stat-card">
            <i class="fas fa-dollar-sign text-green-500 text-2xl"></i>
            <div class="stat-value">
                <c:choose>
                    <c:when test="${not empty totalRevenue}">
                        <fmt:formatNumber value="${totalRevenue}" type="currency" currencySymbol="₫" maxFractionDigits="0"/>
                    </c:when>
                    <c:otherwise>
                        ₫0
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="stat-label">Revenue</div>
        </div>
    </div>

    <div class="recent-activity">
        <h3>Recent Activity</h3>
        <div class="entry">
            <div class="dot bg-green-500" style="background:#4ade80"></div>
            <span>New order #1089 received</span>
            <span class="time">2 min ago</span>
        </div>
        <div class="entry">
            <div class="dot bg-blue-500" style="background:#60a5fa"></div>
            <span>Product "Wireless Earbuds" updated</span>
            <span class="time">1 hour ago</span>
        </div>
        <div class="entry">
            <div class="dot bg-purple-500" style="background:#a770ef"></div>
            <span>New brand "TechPro" added</span>
            <span class="time">3 hours ago</span>
        </div>
    </div>

</body>
</html>
