// 행정구역/시도 select
		window.updateOptions = function selectRegion(cc) {
	
		var region_all = [];  //전체
		var region_seoul = ["강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서울특별시", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "인천광여시", "종로구", "중구", "중랑구"];  //서울특별시
		var region_kyungki= ["고양시", "과천시", "광명시", "구리시", "군포시", "김포시", "남양주시", "동두천시", "부천시", "성남시", "수원시", "시흥시", "안산시", "안성시", "안양시", "양주시", "양평시", "여주시", "연천군", "오산시", "용인시", "의왕시", "의정부시", "이천시", "파주시", "평택시", "포천시", "하남시", "화성시"]; //경기도
		var region_chungnam = ["계룡시", "공주시", "금산군", "논산시", "당진시", "대전광역시", "보령시", "부여군", "서산시", "서천군", "세종시", "아산시", "연기군", "예산군", "천안시", "청양군", "태안군", "홍성군"];  //충청남도
		var region_chungbuk = ["괴산군", "단양군", "보은군", "영동군", "옥천군", "음성군", "제천시", "증평군", "진천군", "청주시", "충주시"]; //충청북도
		var region_kangwon = ["강릉시", "고성군", "동해시", "삼척시", "속초시", "양구군", "양양군", "영월군", "원주시", "인제군", "정선군", "철원군", "춘천시", "태백시", "평창군", "홍천군", "화천군", "횡성군"];  //강원도
		var region_jeonnam = ["강진군", "고흥군", "곡성군", "광양시", "구례군", "나주시", "담양군", "목포시", "무안군", "보성군", "순천시", "신안군", "여수시", "영광군", "영암군", "완도군", "장성군", "장흥군", "진도군", "함평군", "해남군", "화순군"];  //전라남도
		var region_jeonbuk = ["고창군", "군산시", "광주광역시", "김제시", "남원시", "무주군", "부안군", "순창군", "완주군", "익산시", "임실군", "장수군", "전주시", "정읍시", "진안군"];  //전라북도
		var region_kyungnam = ["거제시", "거창군", "고성군", "김해시", "남해군", "대구광역시", "밀양시", "부산광역시", "사천시", "산청군", "양산시", "울산광역시", "의령군", "진주시", "창녕군", "창원시", "통영시", "하동군", "함안군", "함양군", "합천군"];  //경상남도
		var region_kyungbuk = ["경산시", "경상북도", "경주시", "고령군", "구미시", "김천시", "문경시", "봉화군", "상주시", "성주군", "안동시", "영덕군", "영양군", "영주시", "영천시", "예천군", "울릉군", "울진군", "의성군", "청도군", "청송군", "칠곡군", "포항시"];  //경상북도
		var region_jeju = ["서귀포시", "제주시", "제주특별자치도"];  //제주시
		var target = document.getElementById("volunteerListSelectCity");

		if(cc.value == "all") var d = region_all;
		else if(cc.value == "seoul") var d = region_seoul;
		else if(cc.value == "kyungki") var d = region_kyungki;
		else if(cc.value == "chungnam") var d = region_chungnam;
		else if(cc.value == "chungbuk") var d = region_chungbuk;
		else if(cc.value == "kangwon") var d = region_kangwon;
		else if(cc.value == "jeonnam") var d = region_jeonnam;
		else if(cc.value == "jeonbuk") var d = region_jeonbuk;
		else if(cc.value == "kyungnam") var d = region_kyungnam;
		else if(cc.value == "kyungbuk") var d = region_kyungbuk;
		else if(cc.value == "jeju") var d = region_jeju;

		target.options.length = 0;

		for (x in d) {
			var opt = document.createElement("option");
			opt.value = d[x];
			opt.innerHTML = d[x];
			target.appendChild(opt);
		}	
	}

	// 봉사 카테고리 필터
	window.updateOptions = function addFilter(value) {
				const filterContainer = document.getElementById('volunteerListFilterContainer');
				const existingFilter = document.getElementById(`filter-${value}`);
				if (!existingFilter) {
					const filterBtn = document.createElement('button');
					filterBtn.className = 'filter-btn';
					filterBtn.id = `filter-${value}`;
					filterBtn.textContent = value;
					/* filterBtn.value = value; */

					const removeBtn = document.createElement('span');
					removeBtn.className = 'remove-btn';
					removeBtn.textContent = 'x';
					removeBtn.onclick = () => removeFilter(value);

					filterBtn.appendChild(removeBtn);
					filterContainer.appendChild(filterBtn);
				}
			}

        function removeFilter(value) {
            const filterBtn = document.getElementById(`filter-${value}`);
            if (filterBtn) {
                filterBtn.remove();
            }
        }
        
        window.onload = function() {
        	const buttons = document.querySelectorAll('.volunteerListCategoryConatiner button');
        	buttons.forEach(button => {
        		 button.addEventListener('click', () => addFilter(button.textContent));
        	});
        }