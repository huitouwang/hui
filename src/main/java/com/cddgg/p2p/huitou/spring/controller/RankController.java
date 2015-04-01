package com.cddgg.p2p.huitou.spring.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cddgg.p2p.core.service.LoanrecordService;
import com.cddgg.p2p.huitou.model.UserRank;

/**
 * 排行控制器
 * @author colin
 *
 */
@Controller
@RequestMapping("/rank")
public class RankController {

	@Resource
	private LoanrecordService loanRecordService;

/**
 * 总排行
 * @param id
 * @param request
 * @return
 */
	@RequestMapping("totalRank.htm")
	public List<UserRank> totalRank(HttpServletRequest request) {
				
		return loanRecordService.getRank(1);
	}

}
