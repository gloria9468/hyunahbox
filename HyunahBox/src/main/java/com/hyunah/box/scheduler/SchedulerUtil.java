package com.hyunah.box.scheduler;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.XML;

import com.hyunah.box.model.MovieApi;

public class SchedulerUtil {
	
	public Map<String, Object> getKobisApiDataMap(String itemPerPage) throws Exception{
		StringBuilder urlBuilder = null;
		Map<String, Object> apiDataMap = new HashMap<String, Object>();
		
		// 어제 날짜.
		DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -1);
		String targetDt = dateFormat.format(cal.getTime());
		
		urlBuilder = new StringBuilder("http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("key","UTF-8") + "=c0c9c3bc18fdc47478ecc9f607e9b00d"); /* key */
        urlBuilder.append("&" + URLEncoder.encode("targetDt","UTF-8") + "=" + URLEncoder.encode(targetDt, "UTF-8")); /* targetDt */
        urlBuilder.append("&" + URLEncoder.encode("itemPerPage","UTF-8") + "=" + URLEncoder.encode(itemPerPage, "UTF-8")); /* itemPerPage */
        
        apiDataMap.put("applicationType", "application/json");
        apiDataMap.put("urlBuilder", urlBuilder);
		
		return apiDataMap;
	}
	
	public Map<String, Object> getKmdbApiDataMap(String title, String releaseDts) throws Exception{
		StringBuilder urlBuilder = null;
		Map<String, Object> apiDataMap = new HashMap<String, Object>();
		
		urlBuilder = new StringBuilder("http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_xml2.jsp"); /*URL*/
	    urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=0D3A8A0HF0VD5ZM0RBA1"); /* key */
	    urlBuilder.append("&" + URLEncoder.encode("collection","UTF-8") + "=kmdb_new2"); /* collection */
	    urlBuilder.append("&" + URLEncoder.encode("sort","UTF-8") + "=title,0"); /* sort */
	    urlBuilder.append("&" + URLEncoder.encode("listCount","UTF-8") + "=1"); /* listCount */
	    urlBuilder.append("&" + URLEncoder.encode("detail","UTF-8") + "=Y"); /* detail */
	    urlBuilder.append("&" + URLEncoder.encode("releaseDts","UTF-8") + "=" + URLEncoder.encode(releaseDts, "UTF-8")); /* 개봉일 */
	    urlBuilder.append("&" + URLEncoder.encode("title","UTF-8") + "=" + URLEncoder.encode(title, "UTF-8")); /* 영화명 */
	    
	    apiDataMap.put("applicationType", "application/xml");
	    apiDataMap.put("urlBuilder", urlBuilder);
		
		return apiDataMap;
	}

	

	public StringBuilder getJsonDataFromApi( Map<String, Object> getApiDataMap ) throws Exception{
		StringBuilder urlBuilder = (StringBuilder) getApiDataMap.get("urlBuilder");
		String applicationType = (String) getApiDataMap.get("applicationType");

		URL url = new URL(urlBuilder.toString());
		HttpURLConnection urlConn = (HttpURLConnection) url.openConnection();
		urlConn.setRequestMethod("GET");
		urlConn.setRequestProperty("Content-type", applicationType);
		
		BufferedReader rd;
		if(urlConn.getResponseCode() >= 200 && urlConn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(urlConn.getInputStream(), "UTF-8"));
		} else {
			rd = new BufferedReader(new InputStreamReader(urlConn.getErrorStream(), "UTF-8"));
		}

		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		
		rd.close();
		urlConn.disconnect();
		//System.out.println(sb.toString());
		
		return sb;
	}
	
	public JSONArray getDailyBoxOfficeList() throws Exception{
		StringBuilder sb = getJsonDataFromApi( getKobisApiDataMap("10") );
		String jsonData = sb.toString();
		JSONObject jsonObject = new JSONObject(jsonData);
		JSONObject boxOfficeResult = jsonObject.getJSONObject("boxOfficeResult");
		JSONArray dailyBoxOfficeList = boxOfficeResult.getJSONArray("dailyBoxOfficeList");
		return dailyBoxOfficeList;
	}
	
	
	public List<MovieApi> addKobisData() throws Exception{
		JSONArray dailyBoxOfficeList = getDailyBoxOfficeList();

		List<MovieApi> movieApiList = new ArrayList<MovieApi>();
		for (int i = 0; i < dailyBoxOfficeList.length(); i++) {
		    JSONObject movie = dailyBoxOfficeList.getJSONObject(i);
		    String rank = movie.getString("rank");
		    String movieNm = movie.getString("movieNm");
		    String openDt = (movie.getString("openDt")).replaceAll("[^0-9]", "");
		    String movieCd = movie.getString("movieCd");
		    
		    MovieApi movieApi = new MovieApi();
		    movieApi.setMovieCdKobis(movieCd);
		    movieApi.setTitle(movieNm);
		    movieApi.setOpenDate(openDt);
		    movieApiList.add(movieApi);
		}
		return movieApiList;
	}
	
	public List<MovieApi> addKmdbData(List<MovieApi> movieApiList) throws Exception{
		for(int i=0; i < movieApiList.size(); i++) {
			MovieApi movieApi = movieApiList.get(i);
			String title = movieApi.getTitle();
			String openDate = movieApi.getOpenDate();
			
			StringBuilder sb = getJsonDataFromApi( getKmdbApiDataMap(title, openDate) );
			String xmlStr = sb.toString();
			JSONObject jsonObject = XML.toJSONObject(xmlStr);
			
			JSONObject searchObj = jsonObject.getJSONObject("Search");
			JSONObject resultObj = searchObj.getJSONObject("Result");
			JSONObject rowObj = resultObj.getJSONObject("Row");
					
			String movieCdKmdb = ((String) rowObj.get("movieSeq")).trim();
			int movieTime = Integer.parseInt(((String) rowObj.get("runtime")).trim());
			String posters = (rowObj.get("posters")).toString();
			String posterUrl = (posters.substring(0, posters.indexOf("|",1))).trim();
			
			movieApi.setMovieCdKmdb(movieCdKmdb);
			movieApi.setMovieTime(movieTime);
			movieApi.setPosterUrl(posterUrl);
			
		}
		
		return movieApiList;
	}
	
}
