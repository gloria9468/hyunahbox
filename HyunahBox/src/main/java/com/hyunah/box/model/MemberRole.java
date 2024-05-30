package com.hyunah.box.model;

public class MemberRole {
	
	private String memberRoleSeq;
	private String memberId;
	private String role;
	private String roleName;
	private String status;
	
	
	public String getMemberRoleSeq() {
		return memberRoleSeq;
	}
	public void setMemberRoleSeq(String memberRoleSeq) {
		this.memberRoleSeq = memberRoleSeq;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
}