package com.oracle.web.bean;

public class Fenlei {
   
    private Integer fid;

  
    private String fname;

    
    public Integer getFid() {
        return fid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column fenlei.fid
     *
     * @param fid the value for fenlei.fid
     *
     * @mbg.generated Tue May 07 17:10:48 CST 2019
     */
    public void setFid(Integer fid) {
        this.fid = fid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column fenlei.fname
     *
     * @return the value of fenlei.fname
     *
     * @mbg.generated Tue May 07 17:10:48 CST 2019
     */
    public String getFname() {
        return fname;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column fenlei.fname
     *
     * @param fname the value for fenlei.fname
     *
     * @mbg.generated Tue May 07 17:10:48 CST 2019
     */
    public void setFname(String fname) {
        this.fname = fname == null ? null : fname.trim();
    }

	@Override
	public String toString() {
		return "Fenlei [fid=" + fid + ", fname=" + fname + "]";
	}
    
}