libname mylib "P:\DA6823\FA15_Data(1) (2)\";
filename bigrec "P:\DA6823\FA15_Data(1) (2)\fa15_data.txt" lrecl=65576;

data mytemp;                                       
	infile bigrec;                                 
	input 
		myid 1-7                       
		classic_styles_aglo 3409                   
		classic_styles_agli 3436                   
		classic_styles_neutral 3490                   
		classic_styles_dgli 3517                   
		classic_styles_dglo 3544                   
		latest_fashion_trends_aglo 3416                 
		latest_fashion_trends_agli 3443                 
		latest_fashion_trends_neutral 3497                 
		latest_fashion_trends_dgli 3524                 
		latest_fashion_trends_dglo 3551                 
		dress_to_please_myself_aglo 3431                   
		dress_to_please_myself_agli 3458                   
		dress_to_please_myself_neutral 3512                   
		dress_to_please_myself_dgli 3539                   
		dress_to_please_myself_dglo 3566                   
		loyal_to_brands_aglo 3415                
		loyal_to_brands_agli 3442                
		loyal_to_brands_neutral 3496                
		loyal_to_brands_dgli 3523                
		loyal_to_brands_dglo 3550                
		prefer_high_quality_aglo 3419                
		prefer_high_quality_agli 3446                
		prefer_high_quality_neutral 3500                
		prefer_high_quality_dgli 3527                
		prefer_high_quality_dglo 3554        
      	often_buy_clothes_aglo 3417 
        often_buy_clothes_agli 3444 
        often_buy_clothes_neutral 3498 
        often_buy_clothes_dgli 3525 
        often_buy_clothes_dglo 3552 
        fashion_mags_aglo 3414
        fashion_mags_agli 3441
        fashion_mags_neutral 3495
        fashion_mags_dgli 3522
        fashion_mags_dglo 3549
        experiment_new_styles_aglo 3432
        experiment_new_styles_agli 3459
        experiment_new_styles_neutral 3513
        experiment_new_styles_dgli 3540
        experiment_new_styles_dglo 3567
        buy_celebrity_products_aglo 4678
        buy_celebrity_products_agli 4755
        buy_celebrity_products_neutral 4909
        buy_celebrity_products_dgli 4986
        buy_celebrity_products_dglo 5063
        designer_label_image_aglo 3430
        designer_label_image_agli 3457
        designer_label_image_neutral 3511
        designer_label_image_dgli 3538
        designer_label_image_dglo 3565
        functionality_important_aglo 3429
        functionality_important_agli 3456
        functionality_important_neutral 3510
        functionality_important_dgli 3537
        functionality_important_dglo 3564
        make_clothes_last_aglo 3411
        make_clothes_last_agli 3438
        make_clothes_last_neutral 3492
        make_clothes_last_dgli 3519
        make_clothes_last_dglo 3546
        comfort_important_aglo 3410
        comfort_important_agli 3437
        comfort_important_neutral 3491
        comfort_important_dgli 3518
        comfort_important_dglo 3545 
		age_18_24 2401
    	age_25_34 2406
    	age_35_49 2411
    	age_50_plus 2415
    	gender_male 2383
    	gender_female 2384
    	income_50k_59999 2586
    	income_60k_74999 2587
    	income_less_than_25k 2596
    	income_25k_49999 2597
    	income_75k_or_more 2600
		trst_prdt_scl_aglo	6853
		trst_prdt_scl_agli	6868
		trst_prdt_scl_neutral	6898
		trst_prdt_scl_dgli	6913
		trst_prdt_scl_dglo	6928
		rly_on_tv_aglo	 5762
		rly_on_tv_agli	5807
		rly_on_tv_neutral  5897
		rly_on_tv_dgli	5942
		rly_on_tv_dglo	5987
		rd_ads_in_mgz_aglo	5788
		rd_ads_in_mgz_agli	5833
		rd_ads_in_mgz_neutral	5923
		rd_ads_in_mgz_dgli	5968
		rd_ads_in_mgz_dglo	6013
		env_frndly_cmp_aglo	4181
		env_frndly_cmp_agli	4195
		env_frndly_cmp_neutral	4223
		env_frndly_cmp_dgli	4237
		env_frndly_cmp_dglo	4251
		lkout_fr_spl_ofrs_aglo	7612
		lkout_fr_spl_ofrs_agli	7635
		lkout_fr_spl_ofrs_neutral	7681
		lkout_fr_spl_ofrs_dgli	7704
		lkout_fr_spl_ofrs_dglo	7727
        shop_16_or_more 8693
        shop_6_to_15 8694
        shop_1_to_5 8695
		dng_more_shop_ol_aglo 5523
		dng_more_shop_ol_agli 5561
		dng_more_shop_ol_neutral 5637
		dng_more_shop_ol_dgli 5675
		dng_more_shop_ol_dglo 5713
		read_vogue 22271
		read_cosmopolitan 22161
		read_glamour 22138
		watch_american_idol 15139
		watch_america_got_talent 15135
		watch_shark_tank 15324
		Calvin_klein 42421
		wrangler 42453 
		levi 42456
		gap 42429 ;

run; 
proc format;
value myscale
        1 = "disagree a lot"
        2 = "disagree a little"
        3 = "neither agree nor disagree"
        4 = "agree a little"
        5 = "agree a lot";
value yesno
        0 = "no"
        1 = "yes";

value gendresp
		0 = "male"
		1 = "female";

value agefmt
        1 = "18 - 24"
        2 = "25 - 34"
        3 = "35 - 49"
        4 = "50+";

value incomefmt
        3 = "$50,000 - $59,999"
        4 = "$60,000 - $74,999"
        1 = "Less than $25,000"
        2 = "$25,000 - $49,999"
        5 = "$75,000 or more";

value freqfmt
        3 = "16 or more times"
        2 = "6 to 15 times"
        1 = "1 to 5 times";
run;

data myvars;
    set mytemp;
    
    /* Stick with classic styles */
    if classic_styles_dglo  = 1 then classic_styles = 1;
    else if classic_styles_dgli = 1 then classic_styles = 2;
    else if classic_styles_neutral = 1 then classic_styles = 3;
    else if classic_styles_agli = 1 then classic_styles = 4;
    else if classic_styles_aglo = 1 then classic_styles = 5;

    /* Keep up with latest fashion trends */
    if latest_fashion_trends_dglo  = 1 then latest_fashion_trends = 1;
    else if latest_fashion_trends_dgli = 1 then latest_fashion_trends = 2;
    else if latest_fashion_trends_neutral = 1 then latest_fashion_trends = 3;
    else if latest_fashion_trends_agli = 1 then latest_fashion_trends = 4;
    else if latest_fashion_trends_aglo = 1 then latest_fashion_trends = 5;

    /* Dress to please myself */
    if dress_to_please_myself_dglo  = 1 then dress_to_please_myself = 1;
    else if dress_to_please_myself_dgli = 1 then dress_to_please_myself = 2;
    else if dress_to_please_myself_neutral = 1 then dress_to_please_myself = 3;
    else if dress_to_please_myself_agli = 1 then dress_to_please_myself = 4;
    else if dress_to_please_myself_aglo = 1 then dress_to_please_myself = 5;

    /* Stick to favorite clothing brands */
    if loyal_to_brands_dglo  = 1 then loyal_to_brands = 1;
    else if loyal_to_brands_dgli = 1 then loyal_to_brands = 2;
    else if loyal_to_brands_neutral = 1 then loyal_to_brands = 3;
    else if loyal_to_brands_agli = 1 then loyal_to_brands = 4;
    else if loyal_to_brands_aglo = 1 then loyal_to_brands = 5;

    /* Buy the highest quality clothes */
    if prefer_high_quality_dglo  = 1 then prefer_high_quality = 1;
    else if prefer_high_quality_dgli = 1 then prefer_high_quality = 2;
    else if prefer_high_quality_neutral = 1 then prefer_high_quality = 3;
    else if prefer_high_quality_agli = 1 then prefer_high_quality = 4;
    else if prefer_high_quality_aglo = 1 then prefer_high_quality = 5;

	/* Often buy clothes I don't really need */
    if often_buy_clothes_dglo = 1 then often_buy_clothes = 1; 
    else if often_buy_clothes_dgli = 1 then often_buy_clothes = 2; 
    else if often_buy_clothes_neutral = 1 then often_buy_clothes = 3; 
    else if often_buy_clothes_agli = 1 then often_buy_clothes = 4; 
    else if often_buy_clothes_aglo = 1 then often_buy_clothes = 5; 

    /* Fashion mags help determine clothes I buy */
    if fashion_mags_dglo = 1 then fashion_mags = 1; 
    else if fashion_mags_dgli = 1 then fashion_mags = 2; 
    else if fashion_mags_neutral = 1 then fashion_mags = 3; 
    else if fashion_mags_agli = 1 then fashion_mags = 4; 
    else if fashion_mags_aglo = 1 then fashion_mags = 5; 

    /* I like to experiment with new styles */
    if experiment_new_styles_dglo = 1 then experiment_new_styles = 1; 
    else if experiment_new_styles_dgli = 1 then experiment_new_styles = 2; 
    else if experiment_new_styles_neutral = 1 then experiment_new_styles = 3; 
    else if experiment_new_styles_agli = 1 then experiment_new_styles = 4; 
    else if experiment_new_styles_aglo = 1 then experiment_new_styles = 5; 

    /* Buy same products that celebrities use */
    if buy_celebrity_products_dglo = 1 then buy_celebrity_products = 1; 
    else if buy_celebrity_products_dgli = 1 then buy_celebrity_products = 2; 
    else if buy_celebrity_products_neutral = 1 then buy_celebrity_products = 3; 
    else if buy_celebrity_products_agli = 1 then buy_celebrity_products = 4; 
    else if buy_celebrity_products_aglo = 1 then buy_celebrity_products = 5; 

    /* Abstract Construct 2: Attitudes About Apparel */
    /* Designer label improves a person's image */
    if designer_label_image_dglo = 1 then designer_label_image = 1; 
    else if designer_label_image_dgli = 1 then designer_label_image = 2; 
    else if designer_label_image_neutral = 1 then designer_label_image = 3; 
    else if designer_label_image_agli = 1 then designer_label_image = 4; 
    else if designer_label_image_aglo = 1 then designer_label_image = 5; 

    /* Functionality is an important factor in clothes I buy */
    if functionality_important_dglo = 1 then functionality_important = 1; 
    else if functionality_important_dgli = 1 then functionality_important = 2; 
    else if functionality_important_neutral = 1 then functionality_important = 3; 
    else if functionality_important_agli = 1 then functionality_important = 4; 
    else if functionality_important_aglo = 1 then functionality_important = 5; 

    /* I make my clothes last a long time */
    if make_clothes_last_dglo = 1 then make_clothes_last = 1; 
    else if make_clothes_last_dgli = 1 then make_clothes_last = 2; 
    else if make_clothes_last_neutral = 1 then make_clothes_last = 3; 
    else if make_clothes_last_agli = 1 then make_clothes_last = 4; 
    else if make_clothes_last_aglo = 1 then make_clothes_last = 5; 

    /* Comfort is an important factor in clothes I buy */
    if comfort_important_dglo = 1 then comfort_important = 1; 
    else if comfort_important_dgli = 1 then comfort_important = 2; 
    else if comfort_important_neutral = 1 then comfort_important = 3; 
    else if comfort_important_agli = 1 then comfort_important = 4; 
    else if comfort_important_aglo = 1 then comfort_important = 5; 

    /* Creating age group variables */
    if age_18_24 = 1 then age_group = 1;
    else if age_25_34 = 1 then age_group = 2;
    else if age_35_49 = 1 then age_group = 3;
    else if age_50_plus = 1 then age_group = 4;
    
    /* Creating a binary gender variable */
    if gender_female = 1 then gender_resp = 1;
    if gender_male = 1 then gender_resp = 0;
    
    /* Creating income level variables */
    if income_50k_59999 = 1 then income_level = 3;
    else if income_60k_74999 = 1 then income_level = 4;
    else if income_less_than_25k = 1 then income_level = 1;
    else if income_25k_49999 = 1 then income_level = 2;
    else if income_75k_or_more = 1 then income_level = 5;

      /* Trust in products scale */
    if trst_prdt_scl_aglo = 1 then trust_product_scale = 5;
    else if trst_prdt_scl_agli = 1 then trust_product_scale = 4;
    else if trst_prdt_scl_neutral = 1 then trust_product_scale = 3;
    else if trst_prdt_scl_dgli = 1 then trust_product_scale = 2;
    else if trst_prdt_scl_dglo = 1 then trust_product_scale = 1;
    
    /* TV reliance scale */
    if rly_on_tv_aglo = 1 then tv_reliance_scale = 5;
    else if rly_on_tv_agli = 1 then tv_reliance_scale = 4;
    else if rly_on_tv_neutral = 1 then tv_reliance_scale = 3;
    else if rly_on_tv_dgli = 1 then tv_reliance_scale = 2;
    else if rly_on_tv_dglo = 1 then tv_reliance_scale = 1;
    
    /* Reading ads in magazines scale */
    if rd_ads_in_mgz_aglo = 1 then ads_in_magazine_scale = 5;
    else if rd_ads_in_mgz_agli = 1 then ads_in_magazine_scale = 4;
    else if rd_ads_in_mgz_neutral = 1 then ads_in_magazine_scale = 3;
    else if rd_ads_in_mgz_dgli = 1 then ads_in_magazine_scale = 2;
    else if rd_ads_in_mgz_dglo = 1 then ads_in_magazine_scale = 1;
    
    /* Environmental friendliness of companies scale */
    if env_frndly_cmp_aglo = 1 then eco_friendly_companies_scale = 5;
    else if env_frndly_cmp_agli = 1 then eco_friendly_companies_scale = 4;
    else if env_frndly_cmp_neutral = 1 then eco_friendly_companies_scale = 3;
    else if env_frndly_cmp_dgli = 1 then eco_friendly_companies_scale = 2;
    else if env_frndly_cmp_dglo = 1 then eco_friendly_companies_scale = 1;
    
    /* Looking out for special offers scale */
    if lkout_fr_spl_ofrs_aglo = 1 then special_offers_scale = 5;
    else if lkout_fr_spl_ofrs_agli = 1 then special_offers_scale = 4;
    else if lkout_fr_spl_ofrs_neutral = 1 then special_offers_scale = 3;
    else if lkout_fr_spl_ofrs_dgli = 1 then special_offers_scale = 2;
    else if lkout_fr_spl_ofrs_dglo = 1 then special_offers_scale = 1;

	if dng_more_shop_ol_aglo = 1 then doing_more_shop_online = 5;
    else if dng_more_shop_ol_agli = 1 then doing_more_shop_online = 4;
    else if dng_more_shop_ol_neutral = 1 then doing_more_shop_online = 3;
    else if dng_more_shop_ol_dgli = 1 then doing_more_shop_online = 2;
    else if dng_more_shop_ol_dglo = 1 then doing_more_shop_online = 1;
    
    /* Shopping behavior */
    if shop_16_or_more = 1 then frequent_shopper = 3;
    else if shop_6_to_15 = 1 then frequent_shopper = 2;
    else if shop_1_to_5 = 1 then frequent_shopper = 1;

    if gap = . then gap = 0;
    if gap = 1 then gap = 1;

    if wrangler = . then wrangler = 0;
    if wrangler = 1 then wrangler = 1;
    
    if levi = . then levi = 0;
    if levi = 1 then levi = 1;
    
    if calvin_klein = . then calvin_klein = 0;
    if calvin_klein = 1 then calvin_klein = 1;

	if read_vogue = . then read_vogue = 0;
    if read_vogue = 1 then read_vogue = 1;

	if read_cosmopolitan = . then read_cosmopolitan = 0;
	if read_cosmopolitan = 1 then read_cosmopolitan = 1;

	if read_glamour = . then read_glamour = 0;
	if read_glamour = 1 then read_glamour = 1;

	if watch_american_idol = . then watch_american_idol = 0;
    if watch_american_idol = 1 then watch_american_idol = 1;

	if watch_america_got_talent = . then watch_america_got_talent = 0;
	if watch_america_got_talent = 1 then watch_america_got_talent = 1;

	if watch_shark_tank = . then watch_shark_tank = 0;
	if watch_shark_tank = 1 then watch_shark_tank = 1;

    label classic_styles = 'Prefer styles that have stood the test of time';
    label latest_fashion_trends = 'Like to keep up with the latest fashion trends';
    label dress_to_please_myself = 'I dress to please myself, not others';
    label loyal_to_brands = 'I have favorite clothing brands I stick with';
    label prefer_high_quality = 'I prefer wearing the highest quality clothing';
    label often_buy_clothes = 'Often buy clothes I dont really need';
    label fashion_mags = 'Fashion mags help determine clothes I buy';
    label experiment_new_styles = 'I like to experiment with new styles';
    label buy_celebrity_products = 'Buy same products that celebrities use';
    label designer_label_image = "Designer label improves a person's image";
    label functionality_important = 'Functionality is an important factor in clothes I buy';
    label make_clothes_last = 'I make my clothes last a long time';
    label comfort_important = 'Comfort is an important factor in clothes I buy';
    label gap = 'Prefer to buy Gap Clothes';
    label age_group = "Age Group"
    	  gender_resp = "Gender"
          income_level = "Individual Employment Income";
    label wrangler = "wrangler Jeans Bought"
    	  levi = "Levi's Jeans Bought"
    	  calvin_klein = "Calvin Klein Jeans Bought";
    label  trust_product_scale = "Trust in Products"
    	   tv_reliance_scale = "Reliance on TV"
    	   ads_in_magazine_scale = "Read Ads in Magazines"
    	   eco_friendly_companies_scale = "Environmental Friendliness of Companies"
           special_offers_scale = "Look for Special Offers"
		   read_vogue = "Read Vogue Magazine"
		   read_cosmopolitan = "Read cosmopolitan Magazine"
		   read_glamour = "Read glamour Magazine"
		   watch_american_idol = "Watch American Idol"
		   watch_america_got_talent = "Watch America got talent"
		   watch_shark_tank = "Watch Shark Tank"
		   doing_more_shop_online = "Doing more shopping online"
    	   frequent_shopper = "Shopping Frequency";

    format classic_styles myscale. 
           latest_fashion_trends myscale. 
           dress_to_please_myself myscale. 
           loyal_to_brands myscale. 
           prefer_high_quality myscale. 
           often_buy_clothes myscale. 
           fashion_mags myscale. 
           experiment_new_styles myscale. 
           buy_celebrity_products myscale. 
           designer_label_image myscale. 
           functionality_important myscale. 
           make_clothes_last myscale. 
           comfort_important myscale.
	   	   age_group agefmt.
   	       income_level incomefmt.
    	   gender_resp gendresp.
	       gap yesno.
	       wrangler yesno.
    	   levi yesno.
    	   calvin_klein yesno.
		   read_vogue yesno.
		   read_cosmopolitan yesno.
		   read_glamour yesno.
		   watch_american_idol yesno.
		   watch_america_got_talent yesno.
		   watch_shark_tank yesno.
		   trust_product_scale tv_reliance_scale ads_in_magazine_scale eco_friendly_companies_scale special_offers_scale doing_more_shop_online myscale.
	       frequent_shopper freqfmt.;

run;

proc freq data=myvars;
    tables 
	gap
        classic_styles
        latest_fashion_trends
        dress_to_please_myself
        loyal_to_brands
		prefer_high_quality;
run;

proc factor data=myvars
    maxiter=100
    method=principal
    mineigen=1
    rotate=varimax
	nFactors=2 
    msa
    scree
    score
    print
    out=myscores;
    var
        often_buy_clothes
        fashion_mags
        experiment_new_styles
        buy_celebrity_products
        designer_label_image
        functionality_important
        make_clothes_last
        comfort_important;
run;


/* rename the factor variables */
data clusready;
set myscores;
rename factor1 = fashion_orient;
rename factor2 = practical_orient;
rename myid = resp_id;
run;

/* k means clustering using bracketed k=4 clusters */
proc fastclus data=clusready out=myclust  maxiter=100 maxclusters=4;
var
fashion_orient
practical_orient
classic_styles latest_fashion_trends loyal_to_brands prefer_high_quality ;
run;

Proc sort data= myclust out=mysort;
By cluster;
Run;
Proc means data=mysort;
By cluster;
Var age_group income_level gender_resp gap wrangler levi calvin_klein read_cosmopolitan  watch_shark_tank
tv_reliance_scale eco_friendly_companies_scale special_offers_scale;
Run;
