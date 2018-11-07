# ​3.1.2​ Metadata in the DIP

The DIP metadata is based upon the existing common, SIP and AIP specifications. The metadata descriptions provided in this document cover the three core metadata categories: structural[^43] (METS[^44]); preservation[^45] (PREMIS[^46]); and descriptive[^47] (EAD[^48])).

[^43]: Structural metadata describes the physical and/or logical structure of digital resources. The standard that E-ARK recommends for structural metadata is METS.

[^44]: Metadata Encoding and Transmission Standard. The METS schema is a standard for encoding descriptive, administrative, and structural metadata regarding objects within a digital library, expressed using the XML schema language of the World Wide Web Consortium. The standard is maintained in the Network Development and MARC Standards Office of the Library of Congress, and is being developed as an initiative of the Digital Library Federation - <http://www.loc.gov/standards/mets/>

[^45]: Preservation metadata is an essential component of most digital preservation strategies. Preservation metadata is information that supports and documents the digital preservation process - https://en.wikipedia.org/wiki/Preservation\_metadata
The standard that E-ARK recommends for preservation metadata is PREMIS.

[^46]: The Preservation Metadata: Implementation Strategies. The PREMIS Data Dictionary for Preservation Metadata is the international standard for metadata to support the preservation of Digital Objects and ensure their long-term usability - http://www.loc.gov/standards/premis/

[^47]: Also named Descriptive Information in OAIS: The set of information, consisting primarily of Package Descriptions, which is provided to Data Management to support the finding, ordering, and retrieving of OAIS information holdings by Consumers - <http://public.ccsds.org/publications/archive/650x0m2.pdf>.
The standard that E-ARK recommends for descriptive metadata is EAD.

[^48]: Encoded Archival Description. A non-proprietary de facto standard for the encoding of Finding Aids for use in a networked (online) environment. EAD allows the standardization of collection information in Finding Aids within and across repositories. EAD3 About [[http://www.loc.gov/ead/eadabout.html]{.underline}](http://www.loc.gov/ead/eadabout.html).

The DIP is based on the AIP, and structural and preservation metadata are thus always - slightly modified - present in the DIP. The METS file is in the root folder, and its schema file (mets.xsd) is in the /schemas folder. The greater part of the Access Software assumes the existence of an EAD and a PREMIS file in the root /metadata/descriptive folder and in the root /metadata/preservation/ folder respectively. Consequently it is also assumed that pertaining schema files (ead3.xsd; premis.xsd) are present in the /schemas folder.

## ​3.1.2.1​ METS

METS (Metadata Encoding and Transmission Standard) is a standard for encoding descriptive, administrative, and structural metadata expressed using the XML Schema Language.

The XML Schema for METS for an E-ARK DIP is the same XML schema as for an E-ARK AIP (i.e. the same mets.xsd file[^49]).

[^49]: Over time the METS versions will change and therefore they may be a difference in version between the AIP and the DIP, but we assume that the AIP will be migrated and therefore that the difference will not occur or at least be small.

The XML instance for METS for an E-ARK DIP is based on the same instance as an E-ARK AIP (i.e. different mets.xml files).

The differences between a METS instance for an E-ARK DIP vs an E-ARK AIP are small. Actually, most of the metadata differences between an AIP and a DIP are in the PREMIS and the EAD metadata.

The DIP specification is limited to include one and only one representation from an AIP (for which many may exist). The chosen representation is itself an E-ARK IP and therefore follows the same structure. This is reflected in the IP being migrated from an AIP to a DIP. Below is a broad overview of the METS file.

**Table 3 - Broad overview of the METS file**
&nbsp;  | Elements    |           |           | Values                     |Comments
--------|-------------| ----------|-----------|----------------------------|---------------------
**mets**|             |           |           |                            |
&nbsp;  |**metsHdr**  |           |           |                            | 
&nbsp;  |             |**agent**  |           |                            |software or archivist creating the DIP
&nbsp;  | **dmdSec**  |           |           |                            |
&nbsp;  |             |**mdRef**  |           | *EAD*                      |information about the EAD file
&nbsp;  | **amdSec**  |           |           |                            |
&nbsp;  |             |**mdRef**  |           |*PREMIS*                    |information about the PREMIS file
&nbsp;  | **fileSec** |           |           |                            |
&nbsp;  |             |**fileGrp**|           |*Common Specification root* |
&nbsp;  |             |           |**fileGrp**|*metadata*                  |
&nbsp;  |             |           |**fileGrp**|*representations*           | normally only one repr. in the DIP
&nbsp;  |             |           |**fileGrp**|*schemas*                   |
&nbsp;  |             |           |**fileGrp**|*documentation*             |
&nbsp;  |**structMap**|           |           |                            |
&nbsp;  |             | **div**   |           |*metadata*                  |
&nbsp;  |             | **div**   |           |*representations*           |mets pointer to mets file for the repr.
&nbsp;  |             | **div**   |           |*schemas*                   |  
&nbsp;  |             | **div**   |           |*documentation*             |  



In the following the major differences between an XML instance for METS for an E-ARK DIP vs an E-ARK AIP are listed.

**Node level: mets** **Table 4 - Differences between the AIP METS and the DIP METS on node level: mets**

**Element / Attribute**|**Cardinality**|**Description and usage in Common specification**| **Change for DIP**
----------------------|---------------|-------------------------------------------------|-------------------
mets     | 1..1 | The root level element that is required in all METS documents| No change  
\@ID     | 0..1 | Optional, no further requirements | No change
\@OBJID  | 1..1 | Mandatory in this specification. It is recommended that it be the same as the name or ID of the package (the name of the root folder). The OBJID must meet the Common Specification requirement of being unique at least across the repository | Change the value of the attribute OBJID is changed to a new value reflecting the change in the IP from an AIP to a DIP.
\@LABEL  | 0..1 | Optional, if used should be filled with a human-readable description of the package | Change - Recommended to be "METS file describing the DIP matching the OBJID"                                              |
\@TYPE   | 1..1 | Mandatory in this specification. The TYPE attribute must be used for identifying the type of the package (genre), for example ERMS, RDBMS, digitised construction plans. However, there is no fixed vocabulary and as such implementers are welcome to use values most suitable for their needs. | No change    
\@CONTENTTYPESPECIFICATION | 0..1 | An attribute added by this specification. It describes which content information type specification is used for the content. Values of the attribute are fixed in the following vocabulary: SMURFERMS * SMURFSFSB * SIARD1 * SIARD2  SIARDDK * GeoVectorGML * GeoRasterGeotiffNB The vocabulary is extensible as additional content information type specifications are developed. | Change to one of these: SMURFERMS, SMURFSFSB, SIARD1 SIARD2 SIARDDK, OLAPCube, GeoVectorGML GeoRasterGeotiff
\@PROFILE | 1..1 | Mandatory in this specification. The PROFILE attribute has to have as its value the URL of the official Common Specification METS Profile. | No change        


**Node level: metsHdr** **Table 5 - Differences between the AIP METS and the DIP METS on node level: metsHDR**

|  			 			Element/ Attribute   |  			 			Cardinality  |  			 			Description and usage 	  |  			 			Change for DIP 		        |
|------------------------------|----------------------|----------------------------------|----------------------------------|
|  			metsHdr 		     |  			0..1 		     |  			Element 			for describing the package itself 		        |  			  			 		        |
|  			@ID 		     |  			0..1 		     |  			Optional, 			no further requirements 		        |  			No 			change 		        |
|  			@ADMID 		     |  			0..1 		     |  			Optional, 			referring to the appropriate administrative metadata section, if 			used for metadata about the package as a whole. 		           |  			No 			change 		        |
|  			@CREATEDATE 		     |  			1..1 		     |  			Mandatory, 			the date of creation of the package 		        |  			Change 			to creation date for DIP 		        |
|  			@LASTMODDATE 		     |  			0..n 		     |  			Mandatory 			if relevant (in case the package has been modified) 		        |  			Change 			to date of modification, if DIP has been created in several steps. 		        |
|  			@RECORDSTATUS 		     |  			0..1 		     |  			Optional, 			no further requirements 		        |  			No 			change 		        |
|  			@PACKAGETYPE 		     |  			1..1 		     |  			 			An attribute added by the 			Common Specification for describing the type of the IP. The 			vocabulary to be used contains values:SIP, AIP, DIP, AIU, AIC 			The 			vocabulary is managed by the DAS Board and will be updated when 			required. 		                       |  			Change 			to DIP 		        |
|  			agent 		     |  			1..n 		     |  			 			The metsHdr 			must include at least one agent describing the software which has 			been used to create the package (TYPE=”OTHER” ROLE=”CREATOR” 			OTHERTYPE=”SOFTWARE”). 			Description 			of all other agents is optional. 		                       |  			  			 		        |
|  			agent/ 			@ID 		        |  			0..1 		     |  			An 			ID for the agent. 		        |  			No 			change 		        |
|  			agent/ 			@ROLE 		        |  			1..1 		     |  			 			The role of the agent. The 			Common Specification requires describing at least one agent with 			the agent/@ROLE 			value “CREATOR”.  			 			For 			other (optional) occurrences of agent 			this attribute shall use a value from the fixed list provided by 			METS. 		    |  			No 			change 		        |
|  			agent/ 			@OTHERROLE 		        |  			0..1 		     |  			A 			textual description of the role of the agent in case the value of 			agent/@ROLE 			is “OTHER”.  			 		                 |  			No 			change 		        |
|  			agent/ 			@TYPE 		        |  			0..1 		     |  			 			The Common Specification 			requires that at least one instance of the agent 			element includes 			the agent/@TYPE 			attribute with 			the value “OTHER”. 			In 			other occurrences of the agent 			element the attribute is optional. If used, values defined in 			official METS documentation shall be followed (“individual”, 			“organisation”, “other"). 		                                      |  			No 			change 		        |
|  			agent/ 			@OTHERTYPE 		        |  			0..1 		     |  			 			The Common Specification 			requires that at least one instance of the agent 			element includes the agent/@OTHERTYPE 			attribute with the value “SOFTWARE”.  			 			In 			other occurrences this attribute shall only be used in case the 			value of agent/@TYPE is “OTHER”. 		                             |  			No 			change 		        |
|  			agent/ 			name 		        |  			1..1 		     |  			The 			name of the agent. In the Common Specification occurrence of the 			agent element 			this element must provide the name of the software tool which was 			used to create the IP.  			 		                    |  			Change 			to name of the agent that created the DIP from the AIP 		        |
|  			agent/ 			note 		        |  			0..1 		     |  			Additional 			information about the agent. We recommend using this element to 			provide version information for the tool which was used to create 			the IP.  			 		                 |  			Change 			to version no. for the DIP creation software. 		        |
|  			altRecordID 		     |  			0..n 		     |  			A 			container for an alternative ID for the package content. 		        |  			No 			change 		        |
|  			altRecordID/ 			@ID 		        |  			0..1 		     |  			An 			ID for the altRecordID 			element within the METS document. 		           |  			No 			change 		        |
|  			altRecordID/ 			@TYPE 		        |  			0..1 		     |  			Used 			to describe the type of ID assigned. It is recommended to use the 			Library of Congress vocabulary for this element when used. 		           |  			No 			change 		        |
|  			metsDocumentID 		     |  			0..1 		     |  			A 			unique identifier for the METS document itself. 		        |  			No 			change 		        |
|  			metsDocumentID/ 			@ID 		        |  			0..1 		     |  			The 			ID of the metsDocumentID 			element. 		           |  			No 			change 		        |
|  			metsDocumentID/ 			@TYPE 		        |  			0..1 		     |  			The 			type of the identifier assigned to the element. 		        |  			No 			change 		        |


