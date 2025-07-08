ALTER TABLE product_tb CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci; -- 이모지
ALTER TABLE product_tb MODIFY prod_name VARCHAR(100) CHARACTER SET utf8mb4; -- 컬럼

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE product_tb;
TRUNCATE TABLE prod_color_tb;
TRUNCATE TABLE prod_size_tb;
TRUNCATE TABLE prod_variant_tb;
TRUNCATE TABLE product_img_tb;
SET FOREIGN_KEY_CHECKS = 1;

select * from product_tb;
select * from prod_variant_tb;
select * from prod_color_tb;
select * from prod_size_tb;

select @color_black_id, @color_brown_id, @color_gray_id, @color_blue_id;

set @color_blue_id =null;



-- 컬러 추가(블랙, 그레이, 브라운, 블루, 아이보리, 핑크, 민트, 네이비, 챠콜, 베이지, 레드, 퍼플, 옐로우, 그린, 화이트)
INSERT INTO prod_color_tb (
  color_name, color_code
) VALUES (
  '블랙', '#000000'
);


INSERT INTO prod_color_tb (
  color_name, color_code
) VALUES (
  '그레이', '#808080'
);


INSERT INTO prod_color_tb (
  color_name, color_code
) VALUES (
  '브라운', '#A52A2A'
);


INSERT INTO prod_color_tb (
  color_name, color_code
) VALUES (
  '블루', '#0000FF'
);


INSERT INTO prod_color_tb (
  color_name, color_code
) VALUES (
  '아이보리', '#FFFFF0'
);


INSERT INTO prod_color_tb (
  color_name, color_code
) VALUES (
  '핑크', '#FFC0CB'
);


INSERT INTO prod_color_tb (
  color_name, color_code
) VALUES (
  '민트', '#AAF0D1'
);


INSERT INTO prod_color_tb (
  color_name, color_code
) VALUES (
  '네이비', '#000080'
);


INSERT INTO prod_color_tb (
  color_name, color_code
) VALUES (
  '챠콜', '#36454F'
);


INSERT INTO prod_color_tb (
  color_name, color_code
) VALUES (
  '베이지', '#F5F5DC'
);


INSERT INTO prod_color_tb (
  color_name, color_code
) VALUES (
  '레드', '#FF0000'
);


INSERT INTO prod_color_tb (
  color_name, color_code
) VALUES (
  '퍼플', '#800080'
);


INSERT INTO prod_color_tb (
  color_name, color_code
) VALUES (
  '옐로우', '#FFFF00'
);


INSERT INTO prod_color_tb (
  color_name, color_code
) VALUES (
  '그린', '#008000'
);


INSERT INTO prod_color_tb (
  color_name, color_code
) VALUES (
  '화이트', '#FFFFFF'
);


select * from prod_color_tb;

-- 사이즈 추가 (S,M,L,free)
-- S
INSERT INTO prod_size_tb (prod_size) VALUES ('S');

-- M
INSERT INTO prod_size_tb (prod_size) VALUES ('M');

-- L
INSERT INTO prod_size_tb (prod_size) VALUES ('L');

-- free
INSERT INTO prod_size_tb (prod_size) VALUES ('free');

select * from prod_size_tb;


-- 제품 등록(outer1)
INSERT INTO product_tb (
  prod_name, price, create_date, is_active, view_count
) VALUES (
  '보잉 윈드브레이커', 59000, NOW(), 1, 0
);

-- 제품 등록(outer2)
INSERT INTO product_tb (
  prod_name, price, create_date, is_active, view_count
) VALUES (
  '레더 블루종 가죽 자켓', 64000, NOW(), 1, 0
);

-- 제품 등록(outer3)
INSERT INTO product_tb (
  prod_name, price, create_date, is_active, view_count
) VALUES (
  '샌드 워싱 데님 자켓', 49000, NOW(), 1, 0
);

-- 제품 등록(outer4)
INSERT INTO product_tb (
  prod_name, price, create_date, is_active, view_count
) VALUES (
  '마카롱 크롭 패딩', 38000, NOW(), 1, 0
);
SET @prod_outer4_id = 4;

-- 제품 등록(outer5)
INSERT INTO product_tb (
  prod_name, price, create_date, is_active, view_count
) VALUES (
  '[하객룩 추천] 보송 트위드 자켓', 62000, NOW(), 1, 0
);
SET @prod_outer5_id = 5;

-- 제품 등록(pants1)
INSERT INTO product_tb (
  prod_name, price, create_date, is_active, view_count
) VALUES (
  '와이드 연청 하이웨스트 팬츠', 28000, NOW(), 1, 0
);
SET @prod_pants1_id = 6;

-- 제품 등록(pants2)
INSERT INTO product_tb (
  prod_name, price, create_date, is_active, view_count
) VALUES (
  '[남녀공용가능] 핀턱 체크 팬츠', 24000, NOW(), 1, 0
);
SET @prod_pants2_id = 7;

-- 제품 등록(pants3)
INSERT INTO product_tb (
  prod_name, price, create_date, is_active, view_count
) VALUES (
  '스카이 핀턱 밴딩 와이드 롱팬츠', 29000, NOW(), 1, 0
);
SET @prod_pants3_id = 8;

-- 제품 등록(pants4)
INSERT INTO product_tb (
  prod_name, price, create_date, is_active, view_count
) VALUES (
  '여름 쿨링 ❄️ 밴딩 찰랑 팬츠', 15000, NOW(), 1, 0
);
SET @prod_pants4_id = 9;

-- 제품 등록(pants5)
INSERT INTO product_tb (
  prod_name, price, create_date, is_active, view_count
) VALUES (
  '틴워싱 A라인 3부 숏데님', 20000, NOW(), 1, 0
);
SET @prod_pants5_id = 10;

-- 제품 등록(skirt1)
INSERT INTO product_tb (
  prod_name, price, create_date, is_active, view_count
) VALUES (
  '러블리 💞퍼프 벌룬 리본 스커트', 21000, NOW(), 1, 0
);
SET @prod_skirt1_id = 11;

-- 제품 등록(skirt2)
INSERT INTO product_tb (
  prod_name, price, create_date, is_active, view_count
) VALUES (
  '포스트 빈티지 워싱 데님스커트', 28000, NOW(), 1, 0
);
SET @prod_skirt2_id = 12;

-- 제품 등록(skirt3)
INSERT INTO product_tb (
  prod_name, price, create_date, is_active, view_count
) VALUES (
  '트로피 롱 밴딩 스커트', 24000, NOW(), 1, 0
);
SET @prod_skirt3_id = 13;

-- 제품 등록(skirt4)
INSERT INTO product_tb (
  prod_name, price, create_date, is_active, view_count
) VALUES (
  '🍒 체리 프릴 스커트', 16000, NOW(), 1, 0
);
SET @prod_skirt4_id = 14;

-- 제품 등록(skirt5)
INSERT INTO product_tb (
  prod_name, price, create_date, is_active, view_count
) VALUES (
  '체크 언발 롱스커트', 18000, NOW(), 1, 0
);
SET @prod_skirt5_id = 15;

-- 제품 등록(tshirts1)
INSERT INTO product_tb (
  prod_name, price, create_date, is_active, view_count
) VALUES (
  '보트넥 오프숄더 반팔 티셔츠', 20000, NOW(), 1, 0
);
SET @prod_tshirts1_id = 16;

-- 제품 등록(tshirts2)
INSERT INTO product_tb (
  prod_name, price, create_date, is_active, view_count
) VALUES (
  '[오프숄더 가능] 나그랑 딥유넥 티셔츠', 20000, NOW(), 1, 0
);
SET @prod_tshirts2_id = 17;

-- 제품 등록(tshirts3)
INSERT INTO product_tb (
  prod_name, price, create_date, is_active, view_count
) VALUES (
  '[끈조절] 캡내장 비비드 나시', 14000, NOW(), 1, 0
);
SET @prod_tshirts3_id = 18;

-- 제품 등록(tshirts4)
INSERT INTO product_tb (
  prod_name, price, create_date, is_active, view_count
) VALUES (
  '루비 레이스 이너 나시', 15000, NOW(), 1, 0
);
SET @prod_tshirts4_id = 19;

-- 제품 등록(tshirts5)
INSERT INTO product_tb (
  prod_name, price, create_date, is_active, view_count
) VALUES (
  '보이 오버핏 티셔츠', 17000, NOW(), 1, 0
);
SET @prod_tshirts5_id = 20;


select * from product_tb;
select * from prod_size_tb;
select * from prod_color_tb;

select * from prod_variant_tb;


-- 제품 등록 variant(outer1)
-- 블랙 + M
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 2, 1, 1
);

-- 블랙 + L
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 3, 1, 1
);

-- 그레이 + M
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 2, 2, 1
);

-- 그레이 + L
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 3, 2, 1
);


-- 제품 등록 variant(outer2)
-- 블랙 + free
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 1000, 1, 4, 1, 2
);

-- 브라운 + free
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 4, 3, 2
);


-- 제품 등록 variant(outer3)
-- 블루 + free
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 4, 4, 3
);


-- 제품 등록 variant(outer4)
-- 아이보리 + free
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 1000, 1, 4, 5, 4
);

-- 핑크 + free
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 4, 6, 4
);

-- 민트 + free
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 4, 7, 4
);


-- 제품 등록 variant(outer5)
-- 아이보리 + free
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 4, 5, 5
);

-- 핑크 + free
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 4, 6, 5
);

select * from prod_variant_tb; -- 12


-- 제품 등록 variant(pants1)
-- 블루 + s
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 1, 4, 6
);

-- 블루 + m
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 2, 4, 6
);

-- 블루 + l
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 3, 4, 6
);


-- 제품 등록 variant(pants2)
-- 네이비 + free
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 4, 8, 7
);


-- 제품 등록 variant(pants3)
-- 블루 + free
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 4, 4, 8
);


-- 제품 등록 variant(pants3)
-- 블루 + free
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 4, 4, 8
);


-- 제품 등록 variant(pants4)
-- 챠콜 + free
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 4, 9, 9
);

-- 옐로우 + free
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 4, 13, 9
);

-- 블루 + free
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 4, 4, 9
);


-- 제품 등록 variant(pants5)
-- 블랙 + s
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 1, 1, 10
);

-- 블랙 + m
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 2, 1, 10
);

-- 블랙 + l
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 3, 1, 10
);

-- 블루 + s
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 1, 4, 10
);

-- 블루 + m
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 2, 4, 10
);

-- 블루 + l
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 3, 4, 10
);

select * from prod_variant_tb; -- 15


-- 제품 등록 variant(skirt1)
-- 화이트 + free
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 2000, 1, 4, 15, 11
);


-- 제품 등록 variant(skirt2)
-- 블루 + s
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 1, 4, 12
);

-- 블루 + m
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 2, 4, 12
);

-- 블루 + l
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 3, 4, 12
);


-- 제품 등록 variant(skirt3)
-- 블랙 + free
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 4, 1, 13
);

-- 챠콜 + free
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 4, 9, 13
);


-- 제품 등록 variant(skirt4)
-- 레드 + free
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 4, 11, 14
);


-- 제품 등록 variant(skirt5)
-- 브라운 + free
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 4, 3, 15
);


-- 제품 등록 variant(tshirts1)
-- 퍼플 + free
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 4, 12, 16
);


-- 제품 등록 variant(tshirts2)
-- 그레이 + free
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 4, 2, 17
);


-- 제품 등록 variant(tshirts3)
-- 옐로우 + free
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 4, 13, 18
);

-- 핑크 + free
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 2000, 1, 4, 6, 18
);


-- 제품 등록 variant(tshirts4)
-- 블루 + free
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 4, 4, 19
);

-- 그린 + free
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 4, 14, 19
);

-- 퍼플 + free
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 4, 12, 19
);


-- 제품 등록 variant(tshirts5)
-- 화이트 + free
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 1000, 1, 4, 15, 20
);

-- 그레이 + free
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 4, 2, 20
);

select * from prod_variant_tb; -- 17






-- 이미지 등록 (outer1)
INSERT INTO product_img_tb (
  prod_img_url, is_main, `product_tb.prod_num`
) VALUES
  ('/product/outer/product1/1.jpg',     0, 1), 
  ('/product/outer/product1/1-1.jpg',   1, 1), -- 대표이미지
  ('/product/outer/product1/1-2.jpg',   0, 1),
  ('/product/outer/product1/1-3.jpg',   0, 1);
  
  
-- 이미지 등록 (outer2)
INSERT INTO product_img_tb (
  prod_img_url, is_main, `product_tb.prod_num`
) VALUES
  ('/product/outer/product2/2.jpg',     0, 2),
  ('/product/outer/product2/2-1.jpg',   1, 2),
  ('/product/outer/product2/2-2.jpg',   0, 2),
  ('/product/outer/product2/2-3.jpg',   0, 2);
  
  
-- 이미지 등록 (outer3)
INSERT INTO product_img_tb (
  prod_img_url, is_main, `product_tb.prod_num`
) VALUES
  ('/product/outer/product3/3.jpg',     0, 3),
  ('/product/outer/product3/3-1.jpg',   1, 3),
  ('/product/outer/product3/3-2.jpg',   0, 3);
  
  
-- 이미지 등록 (outer4)
INSERT INTO product_img_tb (
  prod_img_url, is_main, `product_tb.prod_num`
) VALUES
  ('/product/outer/product4/4.jpg',     0, 4), 
  ('/product/outer/product4/4-1.jpg',   1, 4),
  ('/product/outer/product4/4-2.jpg',   0, 4),
  ('/product/outer/product4/4-3.jpg',   0, 4),
  ('/product/outer/product4/4-4.jpg',   0, 4),
  ('/product/outer/product4/4-5.jpg',   0, 4);
  
  
-- 이미지 등록 (outer5)
INSERT INTO product_img_tb (
  prod_img_url, is_main, `product_tb.prod_num`
) VALUES
  ('/product/outer/product5/5.jpg',     0, 5),  
  ('/product/outer/product5/5-1.jpg',   1, 5),
  ('/product/outer/product5/5-2.jpg',   0, 5),
  ('/product/outer/product5/5-3.jpg',   0, 5),
  ('/product/outer/product5/5-4.jpg',   0, 5),
  ('/product/outer/product5/5-5.jpg',   0, 5);
  
  
-- 이미지 등록 (pants1)
INSERT INTO product_img_tb (
  prod_img_url, is_main, `product_tb.prod_num`
) VALUES
  ('/product/pants/product1/1.jpg',     0, 6), 
  ('/product/pants/product1/1-1.jpg',   1, 6), 
  ('/product/pants/product1/1-2.jpg',   0, 6);
  
  
-- 이미지 등록 (pants2)
INSERT INTO product_img_tb (
  prod_img_url, is_main, `product_tb.prod_num`
) VALUES
  ('/product/pants/product2/2.jpg',     0, 7), 
  ('/product/pants/product2/2-1.jpg',   1, 7), 
  ('/product/pants/product2/2-2.jpg',   0, 7);


-- 이미지 등록 (pants3)
INSERT INTO product_img_tb (
  prod_img_url, is_main, `product_tb.prod_num`
) VALUES
  ('/product/pants/product3/3.jpg',     0, 8), 
  ('/product/pants/product3/3-1.jpg',   1, 8), 
  ('/product/pants/product3/3-2.jpg',   0, 8);


-- 이미지 등록 (pants4)
INSERT INTO product_img_tb (
  prod_img_url, is_main, `product_tb.prod_num`
) VALUES
  ('/product/pants/product4/4.jpg',     0, 9), 
  ('/product/pants/product4/4-1.jpg',   1, 9), 
  ('/product/pants/product4/4-2.jpg',   0, 9), 
  ('/product/pants/product4/4-2.jpg',   0, 9), 
  ('/product/pants/product4/4-2.jpg',   0, 9);


-- 이미지 등록 (pants5)
INSERT INTO product_img_tb (
  prod_img_url, is_main, `product_tb.prod_num`
) VALUES
  ('/product/pants/product5/5.jpg',     0, 10), 
  ('/product/pants/product5/5-1.jpg',   1, 10), 
  ('/product/pants/product5/5-2.jpg',   0, 10),
  ('/product/pants/product5/5-3.jpg',   0, 10);


-- 이미지 등록 (skirt1)
INSERT INTO product_img_tb (
  prod_img_url, is_main, `product_tb.prod_num`
) VALUES
  ('/product/skirt/product1/1.jpg',     0, 11), 
  ('/product/skirt/product1/1-1.jpg',   1, 11);


-- 이미지 등록 (skirt2)
INSERT INTO product_img_tb (
  prod_img_url, is_main, `product_tb.prod_num`
) VALUES
  ('/product/skirt/product2/2.jpg',     0, 12), 
  ('/product/skirt/product2/2-1.jpg',   1, 12),
  ('/product/skirt/product2/2-1.jpg',   0, 12);


-- 이미지 등록 (skirt3)
INSERT INTO product_img_tb (
  prod_img_url, is_main, `product_tb.prod_num`
) VALUES
  ('/product/skirt/product3/3.jpg',     0, 13), 
  ('/product/skirt/product3/3-1.jpg',   1, 13),
  ('/product/skirt/product3/3-1.jpg',   0, 13);


-- 이미지 등록 (skirt4)
INSERT INTO product_img_tb (
  prod_img_url, is_main, `product_tb.prod_num`
) VALUES
  ('/product/skirt/product4/4.jpg',     0, 14), 
  ('/product/skirt/product4/4-1.jpg',   1, 14),
  ('/product/skirt/product4/4-1.jpg',   0, 14);


-- 이미지 등록 (skirt5)
INSERT INTO product_img_tb (
  prod_img_url, is_main, `product_tb.prod_num`
) VALUES
  ('/product/skirt/product5/5.jpg',     0, 15), 
  ('/product/skirt/product5/5-1.jpg',   1, 15),
  ('/product/skirt/product5/5-3.jpg',   0, 15);


-- 이미지 등록 (tshirts1)
INSERT INTO product_img_tb (
  prod_img_url, is_main, `product_tb.prod_num`
) VALUES
  ('/product/tshirts/product1/1.jpg',     0, 16), 
  ('/product/tshirts/product1/1-1.jpg',   1, 16),
  ('/product/tshirts/product1/1-2.jpg',   0, 16);


-- 이미지 등록 (tshirts2)
INSERT INTO product_img_tb (
  prod_img_url, is_main, `product_tb.prod_num`
) VALUES
  ('/product/tshirts/product2/2.jpg',     0, 17), 
  ('/product/tshirts/product2/2-1.jpg',   1, 17),
  ('/product/tshirts/product2/2-2.jpg',   0, 17);


-- 이미지 등록 (tshirts3)
INSERT INTO product_img_tb (
  prod_img_url, is_main, `product_tb.prod_num`
) VALUES
  ('/product/tshirts/product3/3.jpg',     0, 18), 
  ('/product/tshirts/product3/3-1.jpg',   1, 18),
  ('/product/tshirts/product3/3-2.jpg',   0, 18),
  ('/product/tshirts/product3/3-3.jpg',   0, 18);


-- 이미지 등록 (tshirts4)
INSERT INTO product_img_tb (
  prod_img_url, is_main, `product_tb.prod_num`
) VALUES
  ('/product/tshirts/product4/4.jpg',     0, 19), 
  ('/product/tshirts/product4/4-1.jpg',   1, 19),
  ('/product/tshirts/product4/4-2.jpg',   0, 19),
  ('/product/tshirts/product4/4-3.jpg',   0, 19),
  ('/product/tshirts/product4/4-4.jpg',   0, 19),
  ('/product/tshirts/product4/4-5.jpg',   0, 19);


-- 이미지 등록 (tshirts5)
INSERT INTO product_img_tb (
  prod_img_url, is_main, `product_tb.prod_num`
) VALUES
  ('/product/tshirts/product5/5.jpg',     0, 20), 
  ('/product/tshirts/product5/5-1.jpg',   1, 20),
  ('/product/tshirts/product5/5-2.jpg',   0, 20),
  ('/product/tshirts/product5/5-3.jpg',   0, 20);


select * from product_img_tb;