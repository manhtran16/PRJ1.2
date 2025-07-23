<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            color: #333;
        }

        .dashboard-container {
            display: flex;
            min-height: 100vh;
        }

        /* Sidebar */
        .sidebar {
            width: 280px;
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border-right: 1px solid rgba(255, 255, 255, 0.2);
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            z-index: 1000;
        }

        .sidebar-header {
            padding: 1.5rem;
            text-align: center;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-radius: 0 0 20px 20px;
            margin-bottom: 1rem;
        }

        .sidebar-header h1 {
            font-size: 1.4rem;
            font-weight: 700;
            letter-spacing: 1px;
        }

        .sidebar-header .fa-user-shield {
            font-size: 2rem;
            margin-bottom: 0.5rem;
        }

        .nav-menu {
            padding: 0 1rem;
        }

        .nav-item {
            margin-bottom: 0.5rem;
        }

        .nav-link {
            display: flex;
            align-items: center;
            padding: 1rem 1.2rem;
            color: #64748b;
            text-decoration: none;
            border-radius: 12px;
            transition: all 0.3s ease;
            font-weight: 500;
            position: relative;
            overflow: hidden;
        }

        .nav-link:hover {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            transform: translateX(5px);
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.4);
        }

        .nav-link.active {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }

        .nav-link i {
            margin-right: 1rem;
            font-size: 1.1rem;
            width: 20px;
        }

        .logout-section {
            position: absolute;
            bottom: 2rem;
            left: 1rem;
            right: 1rem;
        }

        .logout-btn {
            width: 100%;
            display: flex;
            align-items: center;
            padding: 1rem 1.2rem;
            background: linear-gradient(135deg, #ef4444 0%, #dc2626 100%);
            color: white;
            border: none;
            border-radius: 12px;
            cursor: pointer;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .logout-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(239, 68, 68, 0.4);
        }

        .logout-btn i {
            margin-right: 1rem;
        }

        /* Main Content */
        .main-content {
            flex: 1;
            padding: 2rem;
            overflow-y: auto;
        }

        .header {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border-radius: 20px;
            padding: 1.5rem 2rem;
            margin-bottom: 2rem;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header h2 {
            font-size: 1.8rem;
            font-weight: 700;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .user-info {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .notification-btn {
            position: relative;
            background: none;
            border: none;
            font-size: 1.2rem;
            color: #64748b;
            cursor: pointer;
            transition: color 0.3s ease;
        }

        .notification-btn:hover {
            color: #667eea;
        }

        .notification-badge {
            position: absolute;
            top: -5px;
            right: -5px;
            background: #ef4444;
            color: white;
            border-radius: 50%;
            width: 18px;
            height: 18px;
            font-size: 0.7rem;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .user-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 600;
        }

        /* Stats Cards */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .stat-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border-radius: 20px;
            padding: 1.5rem;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .stat-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
        }

        .stat-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }

        .stat-icon {
            width: 60px;
            height: 60px;
            border-radius: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            color: white;
            margin-bottom: 1rem;
        }

        .stat-icon.orders {
            background: linear-gradient(135deg, #10b981 0%, #059669 100%);
        }

        .stat-icon.products {
            background: linear-gradient(135deg, #f59e0b 0%, #d97706 100%);
        }

        .stat-icon.customers {
            background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%);
        }

        .stat-icon.revenue {
            background: linear-gradient(135deg, #8b5cf6 0%, #7c3aed 100%);
        }

        .stat-value {
            font-size: 2rem;
            font-weight: 700;
            color: #1e293b;
            margin-bottom: 0.5rem;
        }

        .stat-label {
            color: #64748b;
            font-weight: 500;
            margin-bottom: 0.5rem;
        }

        .stat-change {
            display: flex;
            align-items: center;
            font-size: 0.9rem;
            font-weight: 600;
            color: #10b981;
        }

        .stat-change i {
            margin-right: 0.3rem;
        }

        /* Charts Section */
        .charts-section {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 2rem;
            margin-bottom: 2rem;
        }

        .chart-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border-radius: 20px;
            padding: 1.5rem;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
        }

        .chart-header {
            display: flex;
            justify-content: between;
            align-items: center;
            margin-bottom: 1.5rem;
        }

        .chart-title {
            font-size: 1.2rem;
            font-weight: 600;
            color: #1e293b;
        }

        .chart-filters {
            display: flex;
            gap: 0.5rem;
        }

        .filter-btn {
            padding: 0.5rem 1rem;
            border: none;
            border-radius: 8px;
            background: #f1f5f9;
            color: #64748b;
            cursor: pointer;
            font-size: 0.85rem;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .filter-btn.active {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }

        .chart-container {
            height: 300px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%);
            border-radius: 15px;
            position: relative;
        }

        /* Activity Feed */
        .activity-feed {
            max-height: 400px;
            overflow-y: auto;
        }

        .activity-item {
            display: flex;
            align-items: center;
            padding: 1rem 0;
            border-bottom: 1px solid #e2e8f0;
        }

        .activity-item:last-child {
            border-bottom: none;
        }

        .activity-icon {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            margin-right: 1rem;
            flex-shrink: 0;
        }

        .activity-icon.success {
            background: linear-gradient(135deg, #10b981 0%, #059669 100%);
        }

        .activity-icon.info {
            background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%);
        }

        .activity-icon.warning {
            background: linear-gradient(135deg, #f59e0b 0%, #d97706 100%);
        }

        .activity-content {
            flex: 1;
        }

        .activity-text {
            color: #374151;
            font-size: 0.9rem;
            margin-bottom: 0.2rem;
        }

        .activity-time {
            color: #9ca3af;
            font-size: 0.8rem;
        }

        /* Recent Orders Table */
        .orders-section {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border-radius: 20px;
            padding: 1.5rem;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.5rem;
        }

        .section-title {
            font-size: 1.2rem;
            font-weight: 600;
            color: #1e293b;
        }

        .view-all-btn {
            color: #667eea;
            text-decoration: none;
            font-weight: 500;
            font-size: 0.9rem;
            transition: color 0.3s ease;
        }

        .view-all-btn:hover {
            color: #764ba2;
        }

        .orders-table {
            width: 100%;
            border-collapse: collapse;
        }

        .orders-table th {
            text-align: left;
            padding: 1rem;
            color: #64748b;
            font-weight: 600;
            font-size: 0.85rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            border-bottom: 2px solid #e2e8f0;
        }

        .orders-table td {
            padding: 1rem;
            border-bottom: 1px solid #f1f5f9;
            color: #374151;
        }

        .order-status {
            padding: 0.3rem 0.8rem;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 600;
        }

        .status-completed {
            background: #dcfce7;
            color: #16a34a;
        }

        .status-processing {
            background: #fef3c7;
            color: #d97706;
        }

        .status-shipped {
            background: #dbeafe;
            color: #2563eb;
        }

        .order-actions {
            color: #667eea;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        .order-actions:hover {
            color: #764ba2;
        }

        /* Mobile Responsive */
        @media (max-width: 1024px) {
            .charts-section {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 768px) {
            .dashboard-container {
                flex-direction: column;
            }

            .sidebar {
                width: 100%;
                position: fixed;
                top: 0;
                left: 0;
                z-index: 1000;
                transform: translateX(-100%);
                transition: transform 0.3s ease;
            }

            .sidebar.active {
                transform: translateX(0);
            }

            .main-content {
                padding: 1rem;
            }

            .header {
                flex-direction: column;
                gap: 1rem;
                text-align: center;
            }

            .stats-grid {
                grid-template-columns: 1fr;
            }

            .orders-table {
                font-size: 0.8rem;
            }

            .orders-table th,
            .orders-table td {
                padding: 0.5rem;
            }
        }

        /* Mobile Menu Button */
        .mobile-menu-btn {
            display: none;
            position: fixed;
            top: 1rem;
            left: 1rem;
            z-index: 1001;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 50%;
            width: 50px;
            height: 50px;
            font-size: 1.2rem;
            cursor: pointer;
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.4);
        }

        @media (max-width: 768px) {
            .mobile-menu-btn {
                display: flex;
                align-items: center;
                justify-content: center;
            }
        }

        /* Animations */
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .stat-card,
        .chart-card,
        .orders-section {
            animation: fadeInUp 0.6s ease forwards;
        }

        .stat-card:nth-child(1) { animation-delay: 0.1s; }
        .stat-card:nth-child(2) { animation-delay: 0.2s; }
        .stat-card:nth-child(3) { animation-delay: 0.3s; }
        .stat-card:nth-child(4) { animation-delay: 0.4s; }

        /* Scrollbar Styling */
        .activity-feed::-webkit-scrollbar {
            width: 6px;
        }

        .activity-feed::-webkit-scrollbar-track {
            background: #f1f5f9;
            border-radius: 3px;
        }

        .activity-feed::-webkit-scrollbar-thumb {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-radius: 3px;
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <!-- Mobile Menu Button -->
        <button class="mobile-menu-btn" onclick="toggleSidebar()">
            <i class="fas fa-bars"></i>
        </button>

        <!-- Sidebar -->
        <aside class="sidebar" id="sidebar">
            <div class="sidebar-header">
                <i class="fas fa-user-shield"></i>
                <h1>ADMIN PANEL</h1>
            </div>

            <nav class="nav-menu">
                <div class="nav-item">
                    <a href="#" class="nav-link active">
                        <i class="fas fa-tachometer-alt"></i>
                        Dashboard
                    </a>
                </div>
                <div class="nav-item">
                    <a href="index.jsp" class="nav-link">
                        <i class="fas fa-home"></i>
                        User Home
                    </a>
                </div>
                <div class="nav-item">
                    <a href="${pageContext.request.contextPath}/productmanagement" class="nav-link">
                        <i class="fas fa-box"></i>
                        Product Management
                    </a>
                </div>
                <div class="nav-item">
                    <a href="${pageContext.request.contextPath}/brandmanagement" class="nav-link">
                        <i class="fas fa-tags"></i>
                        Brand Management
                    </a>
                </div>
                <div class="nav-item">
                    <a href="${pageContext.request.contextPath}/typemanagement" class="nav-link">
                        <i class="fas fa-list"></i>
                        Type Management
                    </a>
                </div>
                <div class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="fas fa-chart-bar"></i>
                        Statistics
                    </a>
                </div>
                <div class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="fas fa-users"></i>
                        User Management
                    </a>
                </div>
                <div class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="fas fa-cog"></i>
                        Settings
                    </a>
                </div>
            </nav>

            <div class="logout-section">
                <form action="${pageContext.request.contextPath}/logout" method="post" style="margin:0;">
                    <button class="logout-btn" type="submit">
                        <i class="fas fa-sign-out-alt"></i>
                        Logout
            </button>
        </form>
    </div>
        </aside>

        <!-- Main Content -->
        <main class="main-content">
            <!-- Header -->
            <header class="header">
                <h2>Dashboard Overview</h2>
                <div class="user-info">
                    <button class="notification-btn">
                        <i class="fas fa-bell"></i>
                        <span class="notification-badge">3</span>
                    </button>
                    <div class="user-avatar">
                        <i class="fas fa-user"></i>
        </div>
                    <span style="font-weight: 500; color: #64748b;">Admin</span>
    </div>
            </header>

            <!-- Stats Cards -->
            <section class="stats-grid">
        <div class="stat-card">
                    <div class="stat-icon orders">
                        <i class="fas fa-shopping-cart"></i>
                    </div>
            <div class="stat-value">
                        <c:out value="${totalOrders}" />
            </div>
            <div class="stat-label">Total Orders</div>
                    <div class="stat-change">
                        <i class="fas fa-arrow-up"></i>
                        12.5% from last month
                    </div>
        </div>

        <div class="stat-card">
                    <div class="stat-icon products">
                        <i class="fas fa-box-open"></i>
                    </div>
            <div class="stat-value">
                <c:out value="${totalProducts}" default="0"/>
            </div>
            <div class="stat-label">Products</div>
                    <div class="stat-change">
                        <i class="fas fa-arrow-up"></i>
                        8.2% from last month
                    </div>
        </div>

        <div class="stat-card">
                    <div class="stat-icon customers">
                        <i class="fas fa-users"></i>
                    </div>
            <div class="stat-value">
                <c:out value="${totalCustomers}" default="0"/>
            </div>
            <div class="stat-label">Customers</div>
                    <div class="stat-change">
                        <i class="fas fa-arrow-up"></i>
                        5.7% from last month
                    </div>
        </div>

        <div class="stat-card">
                    <div class="stat-icon revenue">
                        <i class="fas fa-dollar-sign"></i>
                    </div>
            <div class="stat-value">
                        <fmt:formatNumber value="${totalRevenue}" type="currency" currencySymbol="$" maxFractionDigits="0"/>
            </div>
            <div class="stat-label">Revenue</div>
                    <div class="stat-change">
                        <i class="fas fa-arrow-up"></i>
                        10.3% from last month
                    </div>
                </div>
            </section>

            <!-- Charts and Activity -->
            <section class="charts-section">
                <div class="chart-card">
                    <div class="chart-header">
                        <h3 class="chart-title">Sales Overview</h3>
                        <div class="chart-filters">
                            <button class="filter-btn active">Weekly</button>
                            <button class="filter-btn">Monthly</button>
                            <button class="filter-btn">Yearly</button>
                        </div>
                    </div>
                    <div class="chart-container">
                        <i class="fas fa-chart-line" style="font-size: 3rem; color: #64748b; opacity: 0.5;"></i>
                        <p style="margin-left: 1rem; color: #64748b;">Sales Chart Placeholder</p>
                    </div>
                </div>

                <div class="chart-card">
                    <div class="chart-header">
                        <h3 class="chart-title">Recent Activity</h3>
                    </div>
                    <div class="activity-feed">
                        <div class="activity-item">
                            <div class="activity-icon success">
                                <i class="fas fa-shopping-cart"></i>
                            </div>
                            <div class="activity-content">
                                <div class="activity-text">New order #1089 received</div>
                                <div class="activity-time">2 minutes ago</div>
                            </div>
                        </div>

                        <div class="activity-item">
                            <div class="activity-icon info">
                                <i class="fas fa-box"></i>
                            </div>
                            <div class="activity-content">
                                <div class="activity-text">Product "Wireless Earbuds" updated</div>
                                <div class="activity-time">1 hour ago</div>
                            </div>
                        </div>

                        <div class="activity-item">
                            <div class="activity-icon warning">
                                <i class="fas fa-tags"></i>
                            </div>
                            <div class="activity-content">
                                <div class="activity-text">New brand "TechPro" added</div>
                                <div class="activity-time">3 hours ago</div>
                            </div>
                        </div>

                        <div class="activity-item">
                            <div class="activity-icon info">
                                <i class="fas fa-user"></i>
                            </div>
                            <div class="activity-content">
                                <div class="activity-text">New customer "Nguyen Van A" registered</div>
                                <div class="activity-time">5 hours ago</div>
        </div>
    </div>

                        <div class="activity-item">
                            <div class="activity-icon warning">
                                <i class="fas fa-exclamation-triangle"></i>
                            </div>
                            <div class="activity-content">
                                <div class="activity-text">Low stock alert for "Gaming Mouse"</div>
                                <div class="activity-time">1 day ago</div>
                            </div>
                        </div>
        </div>
        </div>
            </section>

            <!-- Recent Orders -->
            <section class="orders-section">
                <div class="section-header">
                    <h3 class="section-title">Recent Orders</h3>
                    <a href="#" class="view-all-btn">View all orders</a>
        </div>

                <table class="orders-table">
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Customer</th>
                            <th>Date</th>
                            <th>Amount</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><strong>#1089</strong></td>
                            <td>Tran Thi B</td>
                            <td>May 12, 2023</td>
                            <td>?1,250,000</td>
                            <td><span class="order-status status-completed">Completed</span></td>
                            <td><a href="#" class="order-actions">View</a></td>
                        </tr>
                        <tr>
                            <td><strong>#1088</strong></td>
                            <td>Le Van C</td>
                            <td>May 11, 2023</td>
                            <td>?2,780,000</td>
                            <td><span class="order-status status-processing">Processing</span></td>
                            <td><a href="#" class="order-actions">View</a></td>
                        </tr>
                        <tr>
                            <td><strong>#1087</strong></td>
                            <td>Nguyen Van A</td>
                            <td>May 10, 2023</td>
                            <td>?3,450,000</td>
                            <td><span class="order-status status-shipped">Shipped</span></td>
                            <td><a href="#" class="order-actions">View</a></td>
                        </tr>
                    </tbody>
                </table>
            </section>
        </main>
    </div>

    <script>
        // Toggle sidebar for mobile
        function toggleSidebar() {
            const sidebar = document.getElementById('sidebar');
            sidebar.classList.toggle('active');
        }

        // Handle logout
        function handleLogout() {
            if (confirm('Bạn có chắc chắn muốn đăng xuất?')) {
                // Add logout logic here
                alert('Đăng xuất thành công!');
            }
        }

        // Close sidebar when clicking outside on mobile
        document.addEventListener('click', function(event) {
            const sidebar = document.getElementById('sidebar');
            const mobileBtn = document.querySelector('.mobile-menu-btn');
            
            if (window.innerWidth <= 768) {
                if (!sidebar.contains(event.target) && !mobileBtn.contains(event.target)) {
                    sidebar.classList.remove('active');
                }
            }
        });

        // Handle window resize
        window.addEventListener('resize', function() {
            const sidebar = document.getElementById('sidebar');
            if (window.innerWidth > 768) {
                sidebar.classList.remove('active');
            }
        });

        // Add click effects to all interactive elements
        document.querySelectorAll('button, a, .nav-link').forEach(element => {
            element.addEventListener('click', function(e) {
                // Create ripple effect
                    const ripple = document.createElement('div');
                    const rect = this.getBoundingClientRect();
                const size = Math.max(rect.width, rect.height);
                const x = e.clientX - rect.left - size / 2;
                const y = e.clientY - rect.top - size / 2;
                
                ripple.style.cssText = `
                    position: absolute;
                    width: ${size}px;
                    height: ${size}px;
                    left: ${x}px;
                    top: ${y}px;
                    background: rgba(255, 255, 255, 0.3);
                    border-radius: 50%;
                    transform: scale(0);
                    animation: ripple 0.6s linear;
                    pointer-events: none;
                `;
            });
        });
    </script>
</body>
</html>