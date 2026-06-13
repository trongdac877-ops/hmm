<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Books - Gần đây</title>
<style>
  @import url('https://fonts.googleapis.com/css2?family=Lora:wght@500;600;700;800&family=Inter:wght@400;500;600;700&display=swap');

  :root {
    --bg: #000000;
    --card: #1c1c1e;
    --orange: #fa9d3b;
    --gray-text: #8e8e93;
    --serif: 'Lora', Georgia, 'Times New Roman', serif;
    --sans: 'Inter', -apple-system, sans-serif;
  }
  
  * { margin: 0; padding: 0; box-sizing: border-box; }
  
  html, body { 
    background: var(--bg); 
    overflow-x: hidden;
  }
  
  body {
    width: 390px;
    margin: 0 auto;
    color: #fff;
    font-family: var(--sans);
    position: relative;
    min-height: 100vh;
    padding-bottom: 90px;
    box-shadow: 0 0 30px rgba(0,0,0,0.8);
  }

  /* ===== Toast Thông báo ===== */
  .toast {
    position: fixed;
    top: -60px;
    left: 50%;
    transform: translateX(-50%);
    background: rgba(44, 44, 46, 0.95);
    color: #fff;
    padding: 10px 20px;
    border-radius: 20px;
    font-size: 13px;
    font-weight: 500;
    z-index: 999;
    box-shadow: 0 8px 20px rgba(0,0,0,0.5);
    border: 1px solid rgba(255,255,255,0.1);
    backdrop-filter: blur(10px);
    transition: top 0.4s cubic-bezier(0.16, 1, 0.3, 1);
    pointer-events: none;
    text-align: center;
    white-space: nowrap;
  }
  .toast.show {
    top: 24px;
  }

  /* ===== Header chính ===== */
  .header {
    display: flex; 
    justify-content: space-between; 
    align-items: center;
    padding: 24px 16px 14px 16px;
  }
  .header h1 {
    font-family: var(--serif);
    font-weight: 800;
    font-size: 32px;
    letter-spacing: -0.5px;
  }
  .header-right { 
    display: flex; 
    align-items: center; 
    gap: 10px; 
  }

  /* score ring */
  .score-ring {
    width: 36px; height: 36px; border-radius: 50%;
    position: relative;
    display: flex; align-items: center; justify-content: center;
    background: #1c1c1e;
  }
  .score-ring svg { position: absolute; inset: 0; transform: rotate(-90deg); }
  .score-ring .nums {
    display: flex; flex-direction: column; align-items: center; line-height: 1;
  }
  .score-ring .big { font-size: 12px; font-weight: 700; color: #fff; }
  .score-ring .small { font-size: 7px; font-weight: 600; color: var(--gray-text); margin-top: 1px; }

  .avatar {
    width: 36px; height: 36px; border-radius: 50%;
    background: #e5e5ea;
    display: flex; align-items: center; justify-content: center;
  }
  .avatar svg { width: 20px; height: 20px; }

  /* ===== Section Titles ===== */
  .section-title {
    font-family: var(--serif);
    font-weight: 800;
    font-size: 22px;
    letter-spacing: -0.3px;
    padding: 16px 16px 10px 16px;
    display: flex; align-items: center; gap: 4px;
  }
  .section-title .chevron {
    font-size: 16px; color: var(--gray-text); font-weight: 700;
  }

  /* ===== Category Cards ===== */
  .cat-card {
    margin: 0 16px 14px 16px;
    height: 160px;
    border-radius: 16px;
    background: var(--card);
    display: flex;
    align-items: center;
    overflow: hidden;
    position: relative;
    cursor: pointer;
    transition: transform 0.2s ease, background-color 0.2s ease;
  }
  .cat-card:active {
    transform: scale(0.98);
    background-color: #2c2c2e;
  }
  .cat-label {
    font-family: var(--serif);
    font-weight: 800;
    font-size: 22px;
    line-height: 1.2;
    letter-spacing: -0.3px;
    padding-left: 20px;
    flex: 1;
    z-index: 5;
    position: relative;
  }
  .cat-books {
    position: absolute;
    right: -20px;
    top: 50%;
    transform: translateY(-50%);
    display: flex;
    height: 150px;
  }
  .book {
    width: 85px; height: 150px;
    margin-left: -22px;
    border-radius: 3px;
    box-shadow: -10px 0 16px rgba(0,0,0,0.5);
    position: relative;
    overflow: hidden;
    flex-shrink: 0;
  }
  .book .txt {
    position: relative; z-index: 2;
    padding: 12px 10px 0 10px;
    font-family: var(--serif);
    font-weight: 800;
    line-height: 1.15;
  }
  .book .txt .title { font-size: 11px; display: block; }
  .book .txt .author {
    font-family: var(--sans);
    font-weight: 600;
    font-size: 9px;
    margin-top: 4px;
    display: block;
    opacity: 0.8;
  }

  /* Gatsby */
  .b-gatsby { background: linear-gradient(150deg,#f3b13a 0%,#e89a1c 60%,#d98a10 100%); color: #171717; }
  .b-gatsby .eye {
    position: absolute; right: 10px; top: 40%; width: 40px; height: 40px;
    border: 4px solid #171717; border-radius: 50%;
  }
  .b-gatsby .eye::after {
    content: ''; position: absolute; inset: 12px; background: #171717; border-radius: 50%;
  }

  /* Tale of Two Cities */
  .b-tale { background: #f3efe6; color: #1a1a1a; }
  .b-tale .photo {
    position: absolute; bottom: 0; left: 0; right: 0; height: 60%;
    background: linear-gradient(180deg,#3a3a3a,#161616);
    clip-path: polygon(22% 0,78% 0,100% 100%,0% 100%);
  }

  /* Pride and Prejudice */
  .b-pride { background: linear-gradient(150deg,#48bfa9 0%,#2c9c87 100%); color: #fff; }
  .b-pride .figure {
    position: absolute; bottom: 0; right: 4px; width: 60px; height: 90px;
    background: linear-gradient(180deg,#222,#000 70%);
    border-radius: 50% 50% 10% 10%/60% 60% 10% 10%;
    opacity: 0.85;
  }

  /* Art of War */
  .b-artofwar { background: linear-gradient(150deg,#f5742a 0%,#e0561a 60%,#cf4710 100%); color: #fff; }
  .b-artofwar .blade {
    position: absolute; bottom: -10px; right: -10px; width: 140%; height: 70%;
    background: linear-gradient(115deg, transparent 46%, #f0f0f0 48%, #fafafa 52%, transparent 54%);
    transform: rotate(8deg);
  }

  /* Treatise */
  .b-treatise { background: #3a3a3c; color: #dedede; }
  .b-treatise .txt { display: flex; flex-direction: column; height: 100%; padding-bottom: 12px; }
  .b-treatise .author { margin-top: auto; }

  /* Republic */
  .b-republic { background: linear-gradient(150deg,#a35a20 0%,#7a3e10 60%,#5e2f0c 100%); color: #fff; }
  .b-republic .txt { display: flex; flex-direction: column; height: 100%; padding-bottom: 12px; }
  .b-republic .author { margin-top: auto; }
  .b-republic .col {
    position: absolute; bottom: 0; right: 12px; width: 10px; height: 75%;
    background: rgba(255,255,255,0.18);
  }

  /* ===== Bestsellers Row ===== */
  .scroll-row {
    display: flex; gap: 10px; padding: 0 16px 8px 16px;
    overflow-x: auto;
  }
  .scroll-row::-webkit-scrollbar { display: none; }
  .shelf-card {
    flex-shrink: 0; width: 120px; height: 180px; border-radius: 8px;
    position: relative; overflow: hidden;
    box-shadow: 0 8px 16px rgba(0,0,0,0.4);
  }

  /* iPhone manual */
  .shelf-iphone {
    background: #e7e7ea;
    display: flex; flex-direction: column; align-items: center;
    padding-top: 18px;
    color: #3a3a3c;
  }
  .shelf-iphone .l1 { font-family: var(--serif); font-weight: 700; font-size: 13px; }
  .shelf-iphone .l2 { font-family: var(--serif); font-weight: 800; font-size: 18px; margin-top: 2px; }
  .shelf-iphone .device {
    margin-top: 14px; width: 70px; height: 105px; border-radius: 12px;
    background: #1a1a1a; border: 4px solid #1a1a1a; overflow: hidden;
    box-shadow: 0 4px 10px rgba(0,0,0,0.25);
  }
  .shelf-iphone .device .scr {
    width: 100%; height: 100%; border-radius: 8px;
    background:
      linear-gradient(180deg, rgba(255,255,255,0.15), transparent 40%),
      repeating-linear-gradient(45deg, #5ac8fa 0 6px, #34c759 6px 12px, #ffd60a 12px 18px, #ff453a 18px 24px);
  }

  /* Pride bestseller */
  .shelf-pride {
    background: linear-gradient(150deg,#48bfa9 0%,#2c9c87 100%);
    padding: 14px 12px;
    display: flex; flex-direction: column;
  }
  .shelf-pride .title { font-family: var(--serif); font-weight: 800; font-size: 17px; line-height: 1.15; }
  .shelf-pride .author { font-family: var(--serif); font-weight: 800; font-size: 13px; margin-top: 4px; }
  .shelf-pride .art {
    margin-top: auto; position: relative; height: 50%;
  }
  .shelf-pride .art .figure {
    position: absolute; bottom: 0; left: 0; right: 0; height: 85%;
    background: linear-gradient(180deg,#222,#000 75%);
    border-radius: 50% 50% 6% 6% / 60% 60% 6% 6%;
    opacity: 0.9;
  }

  .peek {
    flex-shrink: 0; width: 28px; height: 180px; border-radius: 8px;
    background: linear-gradient(150deg,#a35a20,#5e2f0c);
    opacity: 0.55;
  }

  /* ===== Album View (Màn hình phụ dịch mượt mà) ===== */
  .album-view {
    position: fixed;
    top: 0;
    left: 0;
    width: 390px;
    height: 100%;
    background: #0c0c0e;
    z-index: 100;
    transform: translateX(100%);
    transition: transform 0.4s cubic-bezier(0.16, 1, 0.3, 1);
    display: flex;
    flex-direction: column;
    padding-bottom: 90px; /* Chừa không gian cho tabbar */
  }
  .album-view.active {
    transform: translateX(0);
  }
  .album-header {
    display: flex;
    align-items: center;
    padding: 20px 16px 12px 16px;
    border-bottom: 1px solid #1c1c1e;
  }
  .back-button {
    background: none;
    border: none;
    color: var(--orange);
    font-size: 17px;
    font-weight: 500;
    cursor: pointer;
    display: flex;
    align-items: center;
    gap: 4px;
    font-family: var(--sans);
  }
  .album-title {
    flex: 1;
    text-align: center;
    font-family: var(--sans);
    font-weight: 700;
    font-size: 17px;
    margin-right: 60px; /* Cân bằng với nút quay lại */
  }

  /* Grid sách như ảnh ứng dụng Files */
  .books-grid {
    flex: 1;
    overflow-y: auto;
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 16px 12px;
    padding: 20px 16px;
  }
  .grid-item {
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
    cursor: pointer;
  }
  
  /* Khung sách tối giản (Chữ Sách) */
  .book-icon {
    width: 86px;
    height: 114px;
    background: linear-gradient(145deg, #2c2c2e, #1a1a1c);
    border-radius: 8px;
    box-shadow: 0 6px 12px rgba(0,0,0,0.3);
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    padding: 10px;
    position: relative;
    border: 1px solid rgba(255,255,255,0.06);
    margin-bottom: 8px;
    overflow: hidden;
    transition: transform 0.2s ease;
  }
  .grid-item:active .book-icon {
    transform: scale(0.95);
  }
  /* Góc gấp tinh tế kiểu file tài liệu */
  .book-icon::after {
    content: '';
    position: absolute;
    top: 0;
    right: 0;
    width: 14px;
    height: 14px;
    background: #0c0c0e;
    border-bottom-left-radius: 4px;
    box-shadow: -1px 1px 2px rgba(0,0,0,0.3);
  }
  /* Tag Chữ Sách sang trọng */
  .book-tag {
    font-size: 10px;
    text-transform: uppercase;
    font-weight: 700;
    letter-spacing: 1px;
    color: var(--orange);
  }
  .book-inner-title {
    font-size: 11px;
    font-weight: 600;
    color: #fff;
    text-align: left;
    line-height: 1.2;
    display: -webkit-box;
    -webkit-line-clamp: 3;
    -webkit-box-orient: vertical;
    overflow: hidden;
  }

  /* Chi tiết mô tả file */
  .grid-item .title {
    font-size: 12px;
    font-weight: 500;
    color: #ffffff;
    width: 100%;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    margin-bottom: 2px;
  }
  .grid-item .date, .grid-item .location {
    font-size: 10px;
    color: var(--gray-text);
  }

  /* ===== Tab Bar chuẩn iOS ===== */
  .tabbar-wrap {
    position: fixed; 
    bottom: 0; 
    left: 50%;
    transform: translateX(-50%);
    width: 390px;
    display: flex; 
    align-items: center; 
    padding: 8px 16px 20px 16px;
    z-index: 150;
    background: rgba(18, 18, 18, 0.85);
    -webkit-backdrop-filter: blur(20px) saturate(180%);
    backdrop-filter: blur(20px) saturate(180%);
    border-top: 1.5px solid rgba(255, 255, 255, 0.08);
  }
  .tabbar {
    flex: 1;
    display: flex; 
    justify-content: space-around; 
    align-items: center;
  }
  .tab {
    display: flex; 
    flex-direction: column; 
    align-items: center; 
    gap: 4px;
    font-size: 10px; 
    font-weight: 500; 
    color: var(--gray-text);
    cursor: pointer;
    transition: color 0.2s ease;
  }
  .tab.active { 
    color: #2a8fd4; /* Màu xanh của mục đã chọn trong ảnh gốc */
  }
  .tab-icon-wrap {
    width: 24px;
    height: 24px;
    display: flex;
    align-items: center;
    justify-content: center;
  }
  
  /* Biểu tượng "Gần đây" màu xanh nước biển dạng tròn */
  .recent-circle-icon {
    width: 22px;
    height: 22px;
    background: #007aff;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
  }
  .recent-circle-icon svg {
    width: 13px;
    height: 13px;
  }
</style>
</head>
<body>

  <!-- Toast Notification -->
  <div id="toast" class="toast">Mục này hiện chưa có nội dung</div>

  <!-- Trang chủ -->
  <div id="home-view">
    <div class="header">
      <h1>Gần đây</h1>
      <div class="header-right">
        <div class="score-ring">
          <svg viewBox="0 0 42 42">
            <circle cx="21" cy="21" r="18.5" fill="none" stroke="#3a3a3c" stroke-width="3"/>
            <circle cx="21" cy="21" r="18.5" fill="none" stroke="#2a8fd4" stroke-width="3"
                    stroke-dasharray="116" stroke-dashoffset="29" stroke-linecap="round"/>
          </svg>
          <div class="nums"><span class="big">0</span><span class="small">5</span></div>
        </div>
        <div class="avatar">
          <svg viewBox="0 0 24 24" fill="#000"><circle cx="12" cy="8" r="4"/><path d="M4 20c0-4 4-6 8-6s8 2 8 6"/></svg>
        </div>
      </div>
    </div>

    <!-- Khám phá thêm -->
    <div class="section-title">Khám Phá Thêm</div>

    <!-- Album Ngày Mới Card (Có thể nhấn vào) -->
    <div class="cat-card" onclick="openAlbumView()">
      <div class="cat-label">Album<br>Ngày Mới</div>
      <div class="cat-books">
        <div class="book b-gatsby">
          <div class="eye"></div>
          <div class="txt"><span class="title">Gatsby</span></div>
        </div>
        <div class="book b-tale">
          <div class="photo"></div>
          <div class="txt"><span class="title">Two Cities</span></div>
        </div>
        <div class="book b-pride">
          <div class="figure"></div>
          <div class="txt"><span class="title">Pride</span></div>
        </div>
      </div>
    </div>

    <!-- Phi hư cấu -->
    <div class="cat-card">
      <div class="cat-label">Phi hư cấu</div>
      <div class="cat-books">
        <div class="book b-artofwar">
          <div class="blade"></div>
          <div class="txt"><span class="title">Art of War</span></div>
        </div>
        <div class="book b-treatise">
          <div class="txt"><span class="title">Treatise</span></div>
        </div>
        <div class="book b-republic">
          <div class="col"></div>
          <div class="txt"><span class="title">Republic</span></div>
        </div>
      </div>
    </div>

    <!-- Bán chạy nhất -->
    <div class="section-title">Bán Chạy Nhất Mọi Thời Đại <span class="chevron">›</span></div>

    <div class="scroll-row">
      <div class="shelf-card shelf-iphone">
        <div class="l1">Hướng dẫn Sử dụng</div>
        <div class="l2">iPhone</div>
        <div class="device"><div class="scr"></div></div>
      </div>

      <div class="shelf-card shelf-pride">
        <div class="title">Pride and<br>Prejudice</div>
        <div class="author">Jane Austen</div>
        <div class="art">
          <div class="figure"></div>
        </div>
      </div>

      <div class="peek"></div>
    </div>
  </div>

  <!-- Màn hình danh sách sách: Album Ngày Mới (Slide-in) -->
  <div id="album-view" class="album-view">
    <div class="album-header">
      <button class="back-button" onclick="closeAlbumView()">‹ Gần đây</button>
      <div class="album-title">Album Ngày Mới</div>
    </div>
    
    <div class="books-grid">
      <!-- Item 1 -->
      <div class="grid-item">
        <div class="book-icon">
          <div class="book-tag">SÁCH</div>
          <div class="book-inner-title">Sống Mạo Hiểm Một Cách Cẩn Thận</div>
        </div>
        <span class="title">Sống Mạo Hiểm</span>
        <span class="date">6/3/26</span>
        <span class="location">Trên iPhone</span>
      </div>

      <!-- Item 2 -->
      <div class="grid-item">
        <div class="book-icon">
          <div class="book-tag">SÁCH</div>
          <div class="book-inner-title">The Death and Life of Great American Cities</div>
        </div>
        <span class="title">The Death and...</span>
        <span class="date">6/3/26</span>
        <span class="location">Trên iPhone</span>
      </div>

      <!-- Item 3 -->
      <div class="grid-item">
        <div class="book-icon">
          <div class="book-tag">SÁCH</div>
          <div class="book-inner-title">Mastering Bitcoin</div>
        </div>
        <span class="title">Mastering...</span>
        <span class="date">6/3/26</span>
        <span class="location">Trên iPhone</span>
      </div>

      <!-- Item 4 -->
      <div class="grid-item">
        <div class="book-icon">
          <div class="book-tag">SÁCH</div>
          <div class="book-inner-title">Phương Pháp Mới Để Giao Dịch Kiếm Sống</div>
        </div>
        <span class="title">Phương Pháp...</span>
        <span class="date">6/3/26</span>
        <span class="location">Trên iPhone</span>
      </div>

      <!-- Item 5 -->
      <div class="grid-item">
        <div class="book-icon">
          <div class="book-tag">SÁCH</div>
          <div class="book-inner-title">Modern VLSI Design</div>
        </div>
        <span class="title">Modern VLSI...</span>
        <span class="date">6/3/26</span>
        <span class="location">Trên iPhone</span>
      </div>

      <!-- Item 6 -->
      <div class="grid-item">
        <div class="book-icon">
          <div class="book-tag">SÁCH</div>
          <div class="book-inner-title">Hồ Chí Minh Tiểu Sử</div>
        </div>
        <span class="title">1TieuSuVeBac</span>
        <span class="date">6/3/26</span>
        <span class="location">Trên iPhone</span>
      </div>

      <!-- Item 7 -->
      <div class="grid-item">
        <div class="book-icon">
          <div class="book-tag">SÁCH</div>
          <div class="book-inner-title">Becoming Supernatural</div>
        </div>
        <span class="title">Becoming...</span>
        <span class="date">6/3/26</span>
        <span class="location">Trên iPhone</span>
      </div>

      <!-- Item 8 -->
      <div class="grid-item">
        <div class="book-icon">
          <div class="book-tag">SÁCH</div>
          <div class="book-inner-title">CMOS VLSI Design</div>
        </div>
        <span class="title">CMOS_VLSI_Des...</span>
        <span class="date">6/3/26</span>
        <span class="location">Trên iPhone</span>
      </div>

      <!-- Item 9 -->
      <div class="grid-item">
        <div class="book-icon">
          <div class="book-tag">SÁCH</div>
          <div class="book-inner-title">Sách Đọc Thêm</div>
        </div>
        <span class="title">SachMoi.net</span>
        <span class="date">6/3/26</span>
        <span class="location">Trên iPhone</span>
      </div>
    </div>
  </div>

  <!-- Tab Bar cố định bên dưới -->
  <div class="tabbar-wrap">
    <div class="tabbar">
      <!-- Gần đây (Active) -->
      <div class="tab active" onclick="clickHomeTab()">
        <div class="tab-icon-wrap">
          <div class="recent-circle-icon">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round">
              <circle cx="12" cy="12" r="10"></circle>
              <polyline points="12 6 12 12 16 14"></polyline>
            </svg>
          </div>
        </div>
        Gần đây
      </div>
      
      <!-- Space -->
      <div class="tab" onclick="showToast('Mục này hiện chưa có nội dung')">
        <div class="tab-icon-wrap">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round" style="width:22px; height:22px;">
            <path d="M22 19a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h5l2 3h9a2 2 0 0 1 2 2z"></path>
            <circle cx="12" cy="14" r="2"></circle>
            <path d="M12 16v2"></path>
          </svg>
        </div>
        Space
      </div>
      
      <!-- Audio -->
      <div class="tab" onclick="showToast('Tính năng Audio chưa có gì')">
        <div class="tab-icon-wrap">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round" style="width:22px; height:22px;">
            <path d="M3 18v-6a9 9 0 0 1 18 0v6"></path>
            <path d="M21 19a2 2 0 0 1-2 2h-1a2 2 0 0 1-2-2v-3a2 2 0 0 1 2-2h3zM3 19a2 2 0 0 0 2 2h1a2 2 0 0 0 2-2v-3a2 2 0 0 0-2-2H3z"></path>
          </svg>
        </div>
        Audio
      </div>
    </div>
  </div>

  <script>
    // Hàm mở Album Ngày Mới (chuyển động mượt mà)
    function openAlbumView() {
      const album = document.getElementById('album-view');
      album.classList.add('active');
    }

    // Hàm đóng Album Ngày Mới
    function closeAlbumView() {
      const album = document.getElementById('album-view');
      album.classList.remove('active');
    }

    // Nhấn vào tab Gần đây sẽ quay lại màn hình chính nếu đang ở trang phụ
    function clickHomeTab() {
      closeAlbumView();
    }

    // Hiển thị toast thông báo
    let toastTimeout;
    function showToast(message) {
      const toast = document.getElementById('toast');
      toast.innerText = message;
      toast.classList.add('show');
      
      clearTimeout(toastTimeout);
      toastTimeout = setTimeout(() => {
        toast.classList.remove('show');
      }, 2500);
    }
  </script>

</body>
</html>
