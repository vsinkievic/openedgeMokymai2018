
/*------------------------------------------------------------------------
    File        : dataset.i
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Thu Jul 12 17:18:35 EEST 2018
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

DEFINE TEMP-TABLE ttCustomer LIKE Customer BEFORE-TABLE beforeCustomer.  

DEFINE DATASET dsCustomer FOR ttCustomer.
