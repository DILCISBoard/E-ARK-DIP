| ID | Name & Location | Description & usage | Cardinality & Level |
| -- | --------------- | ------------------- | ------------------- |
| <a name="DIP1"></a>**DIP1** | **Package Identifier** <br/> `mets/@OBJID` | Note that the value of the `mets/@OBJID attribute` for the DIP is expected to be different from the SIP and AIP to reflect the creation of a new package. | **1..1** <br/> MUST |
| <a name="DIP2"></a>**DIP2** | **METS Profile** <br/> `mets/@PROFILE` | The value is set to "https://earksip.dilcis.eu/profile/E-ARK-DIP.xml". | **1..1** <br/> MUST |
| <a name="DIP3"></a>**DIP3** | **OAIS Package type information** <br/> `metsHdr[@csip:OAISPACKAGETYPE=`DIP`]` | The in CSIP added attribute `@csip:OAISPACKAGETYPE` is used with the value "DIP". <br/> **See also:** <a href="#VocabularyOAISPackageType" >OAIS Package type</a> | **1..1** <br/> MUST |
| <a name="DIP4"></a>**DIP4** | **Status of the descriptive metadata** <br/> `dmdSec/@STATUS` | Indicates the status of the package using a fixed vocabulary. The status SHOULD in a DIP be set to "CURRENT". <br/> **See also:** <a href="#VocabularyStatus" >dmdSec status</a> | **0..1** <br/> SHOULD |
| <a name="REF_CSIP_1"></a>**REF_CSIP_1** | **Administrative metadata** <br/>  | The DIP <amdSec> element should comply with  <br/>  <amdSec> requirements in the CSIP profile. |  <br/> SHOULD |
| <a name="REF_CSIP_2"></a>**REF_CSIP_2** | **File section** <br/>  | The DIP <fileSec> element should comply with  <br/>  <fileSec> requirements in the CSIP profile. |  <br/> SHOULD |
| <a name="REF_CSIP_3"></a>**REF_CSIP_3** | **Structural description of the package** <br/>  | The DIP <structMap> element should comply with  <br/>  <structMap> requirements in the CSIP profile. |  <br/> SHOULD |
| <a name="REF_METS_1"></a>**REF_METS_1** | **structLink** <br/>  | Section not defined or used in CSIP or DIP, additional own uses may occur. |  <br/> MAY |
| <a name="REF_METS_2"></a>**REF_METS_2** | **behaviorSec** <br/>  | Section not defined or used in CSIP or DIP, additional own uses may occur. |  <br/> MAY |
