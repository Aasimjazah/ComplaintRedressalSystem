package com.ComplaintRedressalSystem.controller;

import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ComplaintRedressalSystem.model.Complaint;
import com.ComplaintRedressalSystem.model.Engineer;
import com.ComplaintRedressalSystem.model.Manager;
import com.ComplaintRedressalSystem.service.ComplaintService;
import com.ComplaintRedressalSystem.service.EngineerService;
import com.ComplaintRedressalSystem.service.ManagerService;


@Controller
public class ComplaintController {
	
	@Autowired
	private ComplaintService complaintService;
	
	@Autowired
	private ManagerService managerService;
	
	@Autowired
	private EngineerService engineerService;
	
	
	@RequestMapping(value = "addComplaint" , method = RequestMethod.POST)
	public String addManager(@ModelAttribute Complaint complaint)
	{
		complaint.setStatus("Open");
		complaint.setUserfeedback("nill");
		complaintService.addComplaint(complaint);
		return "userprofile";
	}
	
	 @RequestMapping(value = "usercomplaints")
	 public String userComplaints(@RequestParam("id")int id ,Model model)
	 {
		 List<Complaint> complaints=complaintService.allComplaints();
		 List<Complaint> usercomplaints = complaints.stream()
		           .filter(e->e.getUid()==id).
		           collect(Collectors.toList());
		 
		 model.addAttribute("usercomplaints", usercomplaints);
		 System.out.println(usercomplaints);
		 
		 return "usercomplaints";
	
	 }
	 
	 @RequestMapping(value = "AllComplaints_M" , method=RequestMethod.GET)
	 public String allComplaints(Model model)
	 {
		 List<Complaint> complaints = complaintService.allComplaints();
		 model.addAttribute("complaints", complaints);
		 
         model.addAttribute("size", complaints.size());
		 
		 List<Engineer> engineers = engineerService.allEngineers();
		 model.addAttribute("engineers", engineers);
		 return "AllComplaints_M";
	 }
	 
	 @RequestMapping(value = "editcomplaint" , method=RequestMethod.GET)
	 public String editComplaint(@RequestParam("uid")int uid,
			                     @RequestParam("eid")int eid,
			                     Model model)
	 {
		 complaintService.editComplaint(uid,eid);
		 List<Complaint> complaints = complaintService.allComplaints();
		 model.addAttribute("complaints", complaints);
		 model.addAttribute("size", complaints.size());
		 return "AllComplaints_M";
	 }
	 
	 @RequestMapping(value = "assignedcomplaint" , method=RequestMethod.GET)
	 public String assignedComplaint(@RequestParam("id")int id,HttpSession session)
	 {
		 List<Complaint> complaints = complaintService.assignedComplaint(id) ;
		 session.setAttribute("complaints", complaints);
		 return "engineerassignedcomplaint";
	 }
	 
	 @RequestMapping(value = "solvedcomplaint", method = RequestMethod.GET)
	 public String solvedComplaint(@RequestParam("id")int id,
			                       @RequestParam("uid")int uid,
			                       @RequestParam("eid")int eid,
			                       Model model)
	 {
		 complaintService.solvedComplaint(id,uid,eid);
		 return "engineerassignedcomplaint";
		 
	 }
	 
	 @RequestMapping(value = "completecomplaint" , method =  RequestMethod.POST)
	 public String completeComplaint(@RequestParam("id")int id,
			                         @RequestParam("uid")int uid,
			                         @RequestParam("eid")int eid,
			                         @RequestParam("feedback")String feedback,
			                         HttpSession session)
	 {
		 System.out.println(id);
		 System.out.println(uid);
		 System.out.println(eid);
		 System.out.println(feedback);
		 complaintService.completeComplaint(id,uid,eid,feedback);
		 return "userprofile";
	 }
}
