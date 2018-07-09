 
 /*------------------------------------------------------------------------
    File        : kvLygtis
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Studentas
    Created     : Mon Jul 09 17:16:55 EEST 2018
    Notes       : 
  ----------------------------------------------------------------------*/

using Progress.Lang.*.
using OpenEdge.Core.Assert from propath.
using src.kvLygtis from propath.
using src.kvLygtis2 from propath.

block-level on error undo, throw.

class tests.kvLygtisTest:

define variable a as decimal no-undo.
define variable b as decimal no-undo.
define variable c as decimal no-undo.
define variable  equation-result as logical no-undo.

define variable lygtiesSprendejas as class kvLygtis no-undo.
define variable lygtiesSprendejas2 as class kvLygtis2 no-undo.


	  
	  
	  
	/*------------------------------------------------------------------------------
	 Purpose:
	 Notes:
	------------------------------------------------------------------------------*/

	@Test.
	method public void kvietimoSintakse(  ):  
    //given
    
    a = 1.
    b = 2.
    c = 2.
    lygtiesSprendejas = new kvLygtis(a,b,c).
    lygtiesSprendejas2 = new kvLygtis2().
    
    //when
    equation-result = lygtiesSprendejas:yraSprendiniai().
    equation-result = lygtiesSprendejas2:yraSprendiniai(a,b,c).
    
 
	end method.
	
	    @Test.
    method public void arSprendziaLygti(  ):  
    //given
    
    a = 4.
    b = 4.
    c = 1.
    
    lygtiesSprendejas = new kvLygtis(a,b,c).
    lygtiesSprendejas2 = new kvLygtis2().
    
    //when
    equation-result = lygtiesSprendejas:yraSprendiniai().
    equation-result = lygtiesSprendejas2:yraSprendiniai(a,b,c).
   
 
    end method.
	
	@Test.
    method public void lygtisSuVienuSprendiniu(  ):  
    //given
    
    a = 4.
    b = 4.
    c = 1.
    
    lygtiesSprendejas = new kvLygtis(a,b,c).
    lygtiesSprendejas2 = new kvLygtis2().
    
    //when
    equation-result = lygtiesSprendejas:yraSprendiniai().
    equation-result = lygtiesSprendejas2:yraSprendiniai(a,b,c).
    
    //then
    Assert:equals (lygtiesSprendejas:x1,lygtiesSprendejas:x2).
    Assert:equals (lygtiesSprendejas2:x1,lygtiesSprendejas2:x2).
    
 
    end method.
    
        @Test.
    method public void detMaziauUzNuli(  ):  
    //given
    
    a = 10.
    b = 4.
    c = 1.
    
    lygtiesSprendejas = new kvLygtis(a,b,c).
    lygtiesSprendejas2 = new kvLygtis2().
    
    //when
    equation-result = lygtiesSprendejas:yraSprendiniai().
    equation-result = lygtiesSprendejas2:yraSprendiniai(a,b,c).
    
    //then
    Assert:equals (?,lygtiesSprendejas:x1).
    Assert:equals (?,lygtiesSprendejas:x2).
    Assert:equals (?,lygtiesSprendejas2:x1).
    Assert:equals (?,lygtiesSprendejas2:x2).
 
    end method.
	

end class.