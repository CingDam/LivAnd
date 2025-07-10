select * from product_tb;
select * from prod_variant_tb;
select * from prod_color_tb;
select * from prod_size_tb;
select * from product_img_tb;
select * from cate_tb;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE product_tb;
TRUNCATE TABLE prod_color_tb;
TRUNCATE TABLE prod_size_tb;
TRUNCATE TABLE prod_variant_tb;
TRUNCATE TABLE product_img_tb;
TRUNCATE TABLE cate_tb;
SET FOREIGN_KEY_CHECKS = 1;

insert into cate_tb(cate_name,parent_id,cate_depth) values ("상의",NULL,1),("하의",NULL,1),("악세서리",NULL,1);
insert into cate_tb(cate_name,parent_id,cate_depth) values ("블라우스",1,2),("셔츠",1,2),("아우터",1,2),("니트",1,2),("가디건",1,2),("티셔츠",1,2),("원피스",1,2);
insert into cate_tb(cate_name,parent_id,cate_depth) values ("스커트",2,2),("팬츠",2,2);
insert into cate_tb(cate_name,parent_id,cate_depth) values ("목걸이",3,2),("팔찌",3,2),("반지",3,2);

ALTER TABLE product_tb CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE product_tb MODIFY prod_name VARCHAR(100) CHARACTER SET utf8mb4; -- 컬럼

INSERT INTO prod_color_tb (color_name, color_code, border_color) VALUES
('블랙', '#000000', '#333333'),
('화이트', '#FFFFFF', '#CCCCCC'),
('레드', '#FF0000', '#CC0000'),
('블루', '#0000FF', '#0000CC'),
('그린', '#00FF00', '#00CC00'),
('옐로우', '#FFFF00', '#CCCC00'),
('핑크', '#FFC0CB', '#FF69B4'),
('베이지', '#F5F5DC', '#DEB887'),
('네이비', '#000080', '#000066'),
('그레이', '#808080', '#666666'),
('골드', '#FFD700', '#DAA520'),
('실버', '#C0C0C0', '#A9A9A9'),
('로즈골드', '#B76E79', '#A05259'),
('브라운', '#A52A2A','#5C1F1F'),
('아이보리', '#FFFFF0','#D6C9B8'),
('민트', '#AAF0D1','#71C7A7'),
('챠콜', '#36454F','#2C363F'),
('퍼플', '#800080', '#4B004B');


-- prod_size_tb 사이즈 번호와 이름 
INSERT INTO prod_size_tb  (prod_size) VALUES
('S'), ('M'), ('L'), ('XL'), ('free');




-- 제품 등록(outer1)
INSERT INTO product_tb (
  prod_name, price, create_date, is_active, view_count, `cate_tb.cate_num`
) VALUES (
  '보잉 윈드브레이커', 59000, NOW(), 1, 0, 6
);

-- 제품 등록(outer2)
INSERT INTO product_tb (
  prod_name, price, create_date, is_active, view_count, `cate_tb.cate_num`
) VALUES (
  '레더 블루종 가죽 자켓', 64000, NOW(), 1, 0, 6
);

-- 제품 등록(outer3)
INSERT INTO product_tb (
  prod_name, price, create_date, is_active, view_count, `cate_tb.cate_num`
) VALUES (
  '샌드 워싱 데님 자켓', 49000, NOW(), 1, 0, 6
);

-- 제품 등록(outer4)
INSERT INTO product_tb (
  prod_name, price, create_date, is_active, view_count, `cate_tb.cate_num`
) VALUES (
  '마카롱 크롭 패딩', 38000, NOW(), 1, 0, 6
);

-- 제품 등록(outer5)
INSERT INTO product_tb (
  prod_name, price, create_date, is_active, view_count, `cate_tb.cate_num`
) VALUES (
  '[하객룩 추천] 보송 트위드 자켓', 62000, NOW(), 1, 0, 6
);

-- 제품 등록(pants1)
INSERT INTO product_tb (
  prod_name, price, create_date, is_active, view_count, `cate_tb.cate_num`
) VALUES (
  '와이드 연청 하이웨스트 팬츠', 28000, NOW(), 1, 0, 12
);

-- 제품 등록(pants2)
INSERT INTO product_tb (
  prod_name, price, create_date, is_active, view_count, `cate_tb.cate_num`
) VALUES (
  '[남녀공용가능] 핀턱 체크 팬츠', 24000, NOW(), 1, 0, 12
);

-- 제품 등록(pants3)
INSERT INTO product_tb (
  prod_name, price, create_date, is_active, view_count, `cate_tb.cate_num`
) VALUES (
  '스카이 핀턱 밴딩 와이드 롱팬츠', 29000, NOW(), 1, 0, 12
);

-- 제품 등록(pants4)
INSERT INTO product_tb (
  prod_name, price, create_date, is_active, view_count, `cate_tb.cate_num`
) VALUES (
  '여름 쿨링 ❄️ 밴딩 찰랑 팬츠', 15000, NOW(), 1, 0, 12
);

-- 제품 등록(pants5)
INSERT INTO product_tb (
  prod_name, price, create_date, is_active, view_count, `cate_tb.cate_num`
) VALUES (
  '틴워싱 A라인 3부 숏데님', 20000, NOW(), 1, 0, 12
);

-- 제품 등록(skirt1)
INSERT INTO product_tb (
  prod_name, price, create_date, is_active, view_count, `cate_tb.cate_num`
) VALUES (
  '러블리 💞퍼프 벌룬 리본 스커트', 21000, NOW(), 1, 0, 11
);

-- 제품 등록(skirt2)
INSERT INTO product_tb (
  prod_name, price, create_date, is_active, view_count, `cate_tb.cate_num`
) VALUES (
  '포스트 빈티지 워싱 데님스커트', 28000, NOW(), 1, 0, 11
);

-- 제품 등록(skirt3)
INSERT INTO product_tb (
  prod_name, price, create_date, is_active, view_count, `cate_tb.cate_num`
) VALUES (
  '트로피 롱 밴딩 스커트', 24000, NOW(), 1, 0, 11
);

-- 제품 등록(skirt4)
INSERT INTO product_tb (
  prod_name, price, create_date, is_active, view_count, `cate_tb.cate_num`
) VALUES (
  '🍒 체리 프릴 스커트', 16000, NOW(), 1, 0, 11
);

-- 제품 등록(skirt5)
INSERT INTO product_tb (
  prod_name, price, create_date, is_active, view_count, `cate_tb.cate_num`
) VALUES (
  '체크 언발 롱스커트', 18000, NOW(), 1, 0, 11
);

-- 제품 등록(tshirts1)
INSERT INTO product_tb (
  prod_name, price, create_date, is_active, view_count, `cate_tb.cate_num`
) VALUES (
  '보트넥 오프숄더 반팔 티셔츠', 20000, NOW(), 1, 0, 9
);

-- 제품 등록(tshirts2)
INSERT INTO product_tb (
  prod_name, price, create_date, is_active, view_count, `cate_tb.cate_num`
) VALUES (
  '[오프숄더 가능] 나그랑 딥유넥 티셔츠', 20000, NOW(), 1, 0, 9
);

-- 제품 등록(tshirts3)
INSERT INTO product_tb (
  prod_name, price, create_date, is_active, view_count, `cate_tb.cate_num`
) VALUES (
  '[끈조절] 캡내장 비비드 나시', 14000, NOW(), 1, 0, 9
);

-- 제품 등록(tshirts4)
INSERT INTO product_tb (
  prod_name, price, create_date, is_active, view_count, `cate_tb.cate_num`
) VALUES (
  '루비 레이스 이너 나시', 15000, NOW(), 1, 0, 9
);

-- 제품 등록(tshirts5)
INSERT INTO product_tb (
  prod_name, price, create_date, is_active, view_count, `cate_tb.cate_num`
) VALUES (
  '보이 오버핏 티셔츠', 17000, NOW(), 1, 0, 9
);

-- bracelet 
INSERT INTO product_tb (prod_name, price, create_date, is_active, view_count,`cate_tb.cate_num`) VALUES
('트위스터 감성 팔찌', 15900, NOW(), 1, 0, 14),
('우아한 팔찌 세트 ', 26900, NOW(), 1, 0, 14),
('로맨틱 진주팔찌 세트', 27900, NOW(), 1, 0, 14),
('데일리 팔찌 세트', 24900, NOW(), 1, 0, 14),
('휴가룩에 어울리는 팔찌 세트', 28900, NOW(), 1, 0, 14),

-- necklace 
('심플 비즈 목걸이', 25900, NOW(), 1, 0, 13),
('우아한 925 하트 펜던트 목걸이', 26900, NOW(), 1, 0, 13),
('925실버 미니 클리스탈 목걸이', 27900, NOW(), 1, 0, 13),
('골드 레이어드 체인 목걸이', 24900, NOW(), 1, 0, 13),
('클라이드 체인 목걸이', 28900, NOW(), 1, 0, 13),

-- ring 
('사이즈 조절 가능한 실버링', 19900, NOW(), 1, 0, 15),
('크리스탈 납작 큐빅링', 20900, NOW(), 1, 0, 15),
('엔틱 모가나이드 반지', 21900, NOW(), 1, 0, 15),
('반짝 큐빅 반지', 18900, NOW(), 1, 0, 15),
('하트링 반지', 22900, NOW(), 1, 0, 15),

-- blouse-shirts
('썸머 프릴 데일리 블라우스', 45000, NOW(), 1, 0, 4),
('기본 포켓 긴팔 셔츠', 29900, NOW(), 1, 0, 5),
('코튼 스프라이트 셔츠', 21900, NOW(), 1, 0, 5),
('꾸안꾸 데일리 셔츠', 49900, NOW(), 1, 0, 5),
('허리잘록핏 반팔 셔츠', 29900, NOW(), 1, 0, 5),

-- knit-cardigan
('기본 브이넥 가디건', 29900, NOW(), 1, 0, 8),
('오픈카라 세미크롭 가디건', 19900, NOW(), 1, 0, 8),
('부클 니트 가디건 ', 25000, NOW(), 1, 0, 8),
('골지 브이넥 니트 가디건', 23800, NOW(), 1, 0, 8),
('반팔 카라 니트 가디건 ', 39200, NOW(), 1, 0, 8),

-- onepiece-set
('빈티지 숏 레이스 원피스', 39900, NOW(), 1, 0, 10),
('데이지 러블리 원피스', 25900, NOW(), 1, 0, 10),
('페미닌 민소매 세트', 59900, NOW(), 1, 0, 10),
('러블리 민소매 세트', 49900, NOW(), 1, 0, 10),
('하라주쿠 크롭 티셔츠&바지 세트', 69900, NOW(), 1, 0, 10);





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
  10, 0, 1, 2, 10, 1
);

-- 그레이 + L
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 3, 10, 1
);


-- 제품 등록 variant(outer2)
-- 블랙 + free
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 1000, 1, 5, 1, 2
);

-- 브라운 + free
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 4, 14, 2
);


-- 제품 등록 variant(outer3)
-- 블루 + free
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 5, 4, 3
);


-- 제품 등록 variant(outer4)
-- 아이보리 + free
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 1000, 1, 5, 15, 4
);

-- 핑크 + free
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 5, 7, 4
);

-- 민트 + free
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 4, 16, 4
);


-- 제품 등록 variant(outer5)
-- 아이보리 + free
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 5, 15, 5
);

-- 핑크 + free
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 5, 7, 5
);


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
  10, 0, 1, 5, 9, 7
);


-- 제품 등록 variant(pants3)
-- 블루 + free
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 5, 4, 8
);


-- 제품 등록 variant(pants3)
-- 블루 + free
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 5, 4, 8
);


-- 제품 등록 variant(pants4)
-- 챠콜 + free
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 5, 17, 9
);

-- 옐로우 + free
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 5, 6, 9
);

-- 블루 + free
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 5, 4, 9
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


-- 제품 등록 variant(skirt1)
-- 화이트 + free
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 2000, 1, 5, 2, 11
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
  10, 0, 1, 5, 1, 13
);

-- 챠콜 + free
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 4, 17, 13
);


-- 제품 등록 variant(skirt4)
-- 레드 + free
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 5, 3, 14
);


-- 제품 등록 variant(skirt5)
-- 브라운 + free
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 5, 14, 15
);


-- 제품 등록 variant(tshirts1)
-- 퍼플 + free
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 5, 18, 16
);


-- 제품 등록 variant(tshirts2)
-- 그레이 + free
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 5, 10, 17
);


-- 제품 등록 variant(tshirts3)
-- 옐로우 + free
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 5, 6, 18
);

-- 핑크 + free
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 2000, 1, 5, 7, 18
);


-- 제품 등록 variant(tshirts4)
-- 블루 + free
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 5, 4, 19
);

-- 그린 + free
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 5, 5, 19
);

-- 퍼플 + free
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 5, 18, 19
);


-- 제품 등록 variant(tshirts5)
-- 화이트 + free
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 1000, 1, 5, 2, 20
);

-- 그레이 + free
INSERT INTO prod_variant_tb (
  stock, extra_price, is_active,
  `prod_size_tb.prod_size_num`,
  `prod_color_tb.prod_color_num`,
  `product_tb.prod_num`
) VALUES (
  10, 0, 1, 5, 10, 20
);

-- 총 44
INSERT INTO prod_variant_tb (stock, extra_price, is_active, `prod_size_tb.prod_size_num`, 
`prod_color_tb.prod_color_num`, `product_tb.prod_num`)
VALUES
-- bracelet 
(5, 0, 1, 5, 11, 21),
(5, 0, 1, 5, 12, 21),
(5, 0, 1, 5, 11, 22),
(5, 0, 1, 5, 12, 22),
(5, 0, 1, 5, 11, 23),
(5, 0, 1, 5, 11, 24),
(5, 0, 1, 5, 12, 24),
(5, 0, 1, 5, 11, 25),

-- necklace
(5, 0, 1, 5, 11, 26),
(5, 0, 1, 5, 11, 27),
(5, 0, 1, 5, 12, 27),
(5, 0, 1, 5, 12, 28),
(5, 0, 1, 5, 11, 29),
(5, 0, 1, 5, 11, 30),

-- ring 
(5, 0, 1, 5, 12, 31),
(5, 0, 1, 5, 12, 32),
(5, 0, 1, 5, 11, 33),
(5, 0, 1, 5, 12, 33),
(5, 0, 1, 5, 13, 33),
(5, 0, 1, 5, 11, 34),
(5, 0, 1, 5, 12, 34),
(5, 0, 1, 5, 12, 34),
(5, 0, 1, 5, 13, 35),

-- blouse-shirts
(5, 0, 1, 1, 8, 36),
(5, 0, 1, 2, 8, 36),
(5, 1000, 1, 3, 8, 36),
(5, 2000, 1, 4, 8, 36),
(5, 0, 1, 1, 7, 37),
(5, 0, 1, 2, 7, 37),
(5, 1000, 1, 3, 7, 37),
(5, 2000, 1, 4, 7, 37),
(5, 0, 1, 1, 2, 37),
(5, 0, 1, 2, 2, 37),
(5, 1000, 1, 3, 2, 37),
(5, 2000, 1, 4, 2, 37),
(5, 0, 1, 1, 4, 37),
(5, 0, 1, 2, 4, 37),
(5, 1000, 1, 3, 4, 37),
(5, 2000, 1, 4, 4, 37),
(5, 0, 1, 1, 7, 38),
(5, 0, 1, 2, 7, 38),
(5, 1000, 1, 3, 7, 38),
(5, 0, 1, 1, 6, 39),
(5, 0, 1, 2, 6, 39),
(5, 1000, 1, 3, 6, 39),
(5, 2000, 1, 4, 6, 39),
(5, 0, 1, 1, 4, 39),
(5, 0, 1, 2, 4, 39),
(5, 1000, 1, 3, 4, 39),
(5, 0, 1, 1, 7, 40),
(5, 0, 1, 2, 7, 40),
(5, 1000, 1, 3, 7, 40),
(5, 2000, 1, 4, 7, 40),
(5, 0, 1, 1, 4, 40),
(5, 0, 1, 2, 4, 40),
(5, 1000, 1, 3, 4, 40),
(5, 0, 1, 1, 2, 40),
(5, 0, 1, 2, 2, 40),
(5, 1000, 1, 3, 2, 40),

-- knit-cardigan
(5, 0, 1, 1, 10, 41),
(5, 0, 1, 2, 10, 41),
(5, 0, 1, 1, 10, 42),
(5, 0, 1, 2, 10, 42),
(5, 1000, 1, 3, 10, 42),
(5, 2000, 1, 4, 10, 42),
(5, 0, 1, 1, 6, 42),
(5, 0, 1, 2, 6, 42),
(5, 1000, 1, 3, 6, 42),
(5, 2000, 1, 4, 6, 42),
(5, 0, 1, 1, 2, 42),
(5, 0, 1, 2, 2, 42),
(5, 1000, 1, 3, 2, 42),
(5, 0, 1, 1, 10, 43),
(5, 0, 1, 2, 10, 43),
(5, 1000, 1, 3, 10, 43),
(5, 2000, 1, 4, 10, 43),
(5, 0, 1, 1, 1, 44),
(5, 0, 1, 2, 1, 44),
(5, 1000, 1, 3, 1, 44),
(5, 2000, 1, 4, 1, 44),
(5, 0, 1, 1, 4, 44),
(5, 0, 1, 2, 4, 44),
(5, 1000, 1, 3, 4, 44),
(5, 2000, 1, 4, 4, 44),
(5, 0, 1, 2, 6, 45),
(5, 1000, 1, 3, 6, 45),
-- onepiece-set
(5, 0, 1, 1, 2, 46),
(5, 0, 1, 2, 2, 46),
(5, 1000, 1, 3, 2, 46),
(5, 2000, 1, 4, 2, 46),
(5, 0, 1, 1, 4, 47),
(5, 0, 1, 2, 4, 47),
(5, 1, 1, 3, 4, 47),
(5, 0, 1, 1, 2, 48),
(5, 0, 1, 2, 2, 48),
(5, 1000, 1, 3, 2, 48),
(5, 2000, 1, 4, 2, 48),
(5, 0, 1, 2, 1, 49),
(5, 1000, 1, 3, 1, 49),
(5, 0, 1, 1, 4, 50),
(5, 0, 1, 2, 4, 50);

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
  
-- -- img insert -- --
-- bracelet1~5 (prod_num = 21)
INSERT INTO product_img_tb (prod_img_url, is_main, `product_tb.prod_num`) VALUES
('/product/accessories/bracelet/product1/1.jpg', 0, 21),
('/product/accessories/bracelet/product1/1-1.jpg', 1, 21),
('/product/accessories/bracelet/product1/1-2.jpg', 0, 21),
('/product/accessories/bracelet/product1/1-3.jpg', 0, 21),
('/product/accessories/bracelet/product2/2.jpg', 0, 22),
('/product/accessories/bracelet/product2/2-1.jpg', 1,22),
('/product/accessories/bracelet/product2/2-2.jpg',0,22),
('/product/accessories/bracelet/product3/3.jpg', 0, 23),
('/product/accessories/bracelet/product3/3-1.jpg', 1, 23),
('/product/accessories/bracelet/product3/3-2.jpg', 0, 23),
('/product/accessories/bracelet/product4/4.jpg', 0, 24),
('/product/accessories/bracelet/product4/4-1.jpg', 1, 24),
('/product/accessories/bracelet/product4/4-2.jpg', 0, 24),
('/product/accessories/bracelet/product5/5.jpg', 0, 25),
('/product/accessories/bracelet/product5/5-1.jpg', 1, 25),
('/product/accessories/bracelet/product5/5-2.jpg', 0, 25),
-- necklace1 ~ 5 (prod_num = 26~30)
('/product/accessories/necklace/product1/1.jpg', 0, 26),
('/product/accessories/necklace/product1/1_1.jpg', 1, 26),
('/product/accessories/necklace/product1/1_2.jpg', 0, 26),
('/product/accessories/necklace/product2/2.jpg', 0, 27),
('/product/accessories/necklace/product2/2_1.jpg', 1, 27),
('/product/accessories/necklace/product2/2_2.jpg', 0, 27),
('/product/accessories/necklace/product3/3.jpg', 0, 28),
('/product/accessories/necklace/product3/3_1.jpg', 1, 28),
('/product/accessories/necklace/product3/3_2.jpg', 0, 28),
('/product/accessories/necklace/product4/4.jpg', 0, 29),
('/product/accessories/necklace/product4/4_1.jpg', 1, 29),
('/product/accessories/necklace/product4/4_2.jpg', 0, 29),
('/product/accessories/necklace/product5/5.jpg', 0, 30),
('/product/accessories/necklace/product1/5_1.jpg', 1, 30),
('/product/accessories/necklace/product1/5_2.jpg', 0, 30),
-- ring1 ~ 5 (prod_num = 31~35)
('/product/accessories/ring/product1/ring1.jpg', 0, 31),
('/product/accessories/ring/product1/ring1_1.jpg', 1, 31),
('/product/accessories/ring/product1/ring1_2.jpg', 0, 31),
('/product/accessories/ring/product2/ring2.jpg', 0, 32),
('/product/accessories/ring/product2/ring2_1.jpg', 1, 32),
('/product/accessories/ring/product2/ring2_2.jpg', 0, 32),
('/product/accessories/ring/product3/ring3.jpg', 0, 33),
('/product/accessories/ring/product3/ring3_1.jpg', 1, 33),
('/product/accessories/ring/product3/ring3_2.jpg', 0, 33),
('/product/accessories/ring/product3/ring3_3.jpg', 0, 33),
('/product/accessories/ring/product4/ring4.jpg', 0, 34),
('/product/accessories/ring/product4/ring4_1.jpg', 1, 34),
('/product/accessories/ring/product4/ring4_2.jpg', 0, 34),
('/product/accessories/ring/product4/ring4_3.jpg', 0, 34),
('/product/accessories/ring/product5/ring5.jpg', 0, 35),
('/product/accessories/ring/product5/ring5_1.jpg', 1, 35),
('/product/accessories/ring/product5/ring5_2.jpg', 0, 35),
('/product/accessories/ring/product5/ring5_3.jpg', 0, 35),
('/product/accessories/ring/product5/ring5_4.jpg', 0, 35),
-- blouse-shirts
('/product/top/blouse-shirts/product1/1.jpg', 0, 36),
('/product/top/blouse-shirts/product1/1-1.jpg', 1, 36),
('/product/top/blouse-shirts/product1/1-2.jpg', 0, 36),
('/product/top/blouse-shirts/product2/2.jpg', 0, 37),
('/product/top/blouse-shirts/product2/2-1.jpg', 1, 37),
('/product/top/blouse-shirts/product2/2-2.jpg', 0, 37),
('/product/top/blouse-shirts/product2/2-3.jpg', 0, 37),
('/product/top/blouse-shirts/product2/2-4.jpg', 0, 37),
('/product/top/blouse-shirts/product3/3.jpg', 0, 38),
('/product/top/blouse-shirts/product3/3-1.jpg', 1, 38),
('/product/top/blouse-shirts/product3/3-2.jpg', 0, 38),
('/product/top/blouse-shirts/product4/4.jpg', 0, 39),
('/product/top/blouse-shirts/product4/4-1.jpg', 1, 39),
('/product/top/blouse-shirts/product4/4-2.jpg', 0, 39),
('/product/top/blouse-shirts/product4/4-3.jpg', 0, 39),
('/product/top/blouse-shirts/product5/5.jpg', 0, 40),
('/product/top/blouse-shirts/product5/5-1.jpg', 1, 40),
('/product/top/blouse-shirts/product5/5-2.jpg', 0, 40),
('/product/top/blouse-shirts/product5/5-3.jpg', 0, 40),
-- knit-cardigan
('/product/top/knit-cardigan/product1/1.jpg', 0, 41),
('/product/top/knit-cardigan/product1/1-1.jpg', 1, 41),
('/product/top/knit-cardigan/product1/1-2.jpg', 0, 41),
('/product/top/knit-cardigan/product2/2.jpg', 0, 42),
('/product/top/knit-cardigan/product2/2-1.jpg', 1, 42),
('/product/top/knit-cardigan/product2/2-2.jpg', 0, 42),
('/product/top/knit-cardigan/product3/3.jpg', 0, 43),
('/product/top/knit-cardigan/product3/3-1.jpg', 1, 43),
('/product/top/knit-cardigan/product3/3-2.jpg', 0, 43),
('/product/top/knit-cardigan/product4/4.jpg', 0, 44),
('/product/top/knit-cardigan/product4/4-1.jpg', 1, 44),
('/product/top/knit-cardigan/product4/4-2.jpg', 0, 44),
('/product/top/knit-cardigan/product4/4-3.jpg', 0, 44),
('/product/top/knit-cardigan/product5/5.jpg', 0, 45),
('/product/top/knit-cardigan/product5/5-1.jpg', 1, 45),
('/product/top/knit-cardigan/product5/5-2.jpg', 0, 45),
-- onepiece-set 
('/product/top/onepiece-set/product1/1.jpg', 0, 46),
('/product/top/onepiece-set/product1/1-1.jpg', 1, 46),
('/product/top/onepiece-set/product2/2.jpg', 0, 47),
('/product/top/onepiece-set/product2/2-1.jpg', 1, 47),
('/product/top/onepiece-set/product3/3.jpg', 0, 48),
('/product/top/onepiece-set/product3/3-1.jpg', 1, 48),
('/product/top/onepiece-set/product4/4.jpg', 0, 49),
('/product/top/onepiece-set/product4/4-1.jpg', 1, 49),
('/product/top/onepiece-set/product5/5.jpg', 0, 50),
('/product/top/onepiece-set/product5/5-1.jpg', 1, 50);


  
SELECT    
  p.prod_num,   
  p.prod_name,   
  p.price,   
  p.view_count,   
  p.create_date,   
  p.is_active,   
  c.cate_name 
FROM    
  product_tb p 
LEFT JOIN    
  cate_tb c ON p.`cate_tb.cate_num` = c.cate_num 
WHERE    
  p.is_active = 1 
LIMIT 0, 1000;


select * from cate_tb;
select * from product_tb;

SELECT * FROM cate_tb WHERE cate_name = '아우터';
SELECT * FROM cate_tb WHERE cate_name IN ('블라우스', '셔츠');

SELECT * FROM product_tb WHERE cate_num IN (
  SELECT cate_num FROM cate_tb WHERE cate_name IN ('블라우스', '셔츠')
);


SELECT * FROM product_tb WHERE cate_num IN (
  SELECT cate_num FROM cate_tb WHERE cate_name IN ('블라우스', '셔츠')
) AND is_active = 1;