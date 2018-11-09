#### ​3.1.2.2​ PREMIS
PREMIS is a standard that mainly caters for long-term preservation and technical usability, which for example is used to facilitate a range of preservation strategies including migration and emulation.
From an Access perspective, PREMIS especially satisfies the requirements pertaining to the recording of Representation Information. It is practical to state in a formalised and consistent way how the Access Software should behave and where it should look when dealing with different pieces of information, such as which representation formats are included in the DIP. Therefore all E-ARK Access Software assumes the availability of PREMIS metadata according to the specification below.

##### ​3.1.2.2.1​ Metadata regarding Representations and Access Software
In PREMIS, a representation is a "set of files, including structural metadata, needed for a complete and reasonable rendition of an Intellectual Entity."[^50].

[^50]: PREMIS Editorial Committee (2015). "PREMIS Data Dictionary for Preservation Metadata", p.8.

One of the core concepts in PREMIS is the above formulated definition of a representation, but it is also important to note that the E-ARK Common Specification Information Package structure also incorporates physical management of different representations. When implementing PREMIS in E-ARK packages one must therefore choose if there must exist PREMIS files at representation level or at root level only (see Common Specification) and one must also choose how fine-grained each description should be.

In PREMIS, a representation is indicated using the semantic unit "1.1 objectIdentifier". In E-ARK Access, as already mentioned, the DIP representation formats are SMURF ERMS, SMURF SFSB, SIARD1.0, SIARD2.0, SIARDDK, OLAP, GML, and GeoTIFF. It is important to emphasise that the E-ARK project has neither created specifications nor tools for specific file formats[^51] (fine-grained descriptions), but only for the aforementioned DIP *representation formats*.

[^51]: For example PDF or JPG.

Hence, the Access Software developed by the E-ARK project does guarantee the rendering of the E-ARK 
representations, but not of specific file formats contained *inside* an E-ARK representation. As an example, the SMURF ERMS could contain several file formats unknown to the E-ARK IP Viewer[^52] (note: even though this is unlikely, because archives generally make sure that the number of file formats that they preserve is limited and their use widespread. As such for example PDF or TIFF files would be rendered).

[^52]: The generic Access tool that allows for the rendering of the DIP reference format, ie. the folder structure, descriptive metadata,and the most common file formats, cf. D5.4 Search, Access and Display Interfaces. http://www.eark-project.com/resources/project-deliverables/92-d54

To enable rendition, three pieces of information are needed in PREMIS: One identifying the representation to be rendered; one identifying the software to enable this; and one establishing a
To enable rendition, three pieces of information are needed in PREMIS: One identifying the representation to be rendered; one identifying the software to enable this; and one establishing a relationship between the two.

The descriptions below therefore show how to:
1.  Describe which DIP representation format is contained in the DIP (description 1 below);
2.  Describe which piece(s) of Access Software is/are needed to render a specific DIP representation format. Several pieces of software may indeed be needed (description 2 below);
3.  Describe the relationship between the DIP representation format and its Access Software (description 3 below).

###### ​3.1.2.2.1.1​ Description 1 - The recording of DIP representation formats
In order to describe the specific DIP representation format the semantic component "1.4 significantProperties" is used. An example is:

**Table 11 - Recording of DIP representation formats**
```xml
<object xsi:type=\"representation\"\>\                                                               
 <objectIdentifier\>\                                                                                 
  <objectIdentifierType\>filepath\</objectIdentifierType\>                                                                                                                                                    
  <objectIdentifierValue\>xlink:href=\"representations\\AVID.SA.18006.rep0\"\</objectIdentifierValue\>                                                                                                        
 </objectIdentifier\>\                                                                                
 <significantProperties\>\                                                                            
  <significantPropertiesType\>DIP representation format\</significantPropertiesType\>\                 
  <significantPropertiesValue\>SIARD2\</significantPropertiesValue\>\                                  
 </significantProperties\>\                                                                           
<!-- PREMIS file continues but further elements left out in this example-->                     
```
Note that the object type is "representation" and that the objectIdentifierType value is "filepath", which according to the AIP specification is an IP scope value. The objectIdentifierValue is the filepath to the representation folder or could be a filepath to a file.

###### ​3.1.2.2.1.2​ Description 2 - The recording of Access Software
In PREMIS 3.0 a description of an environment has become an object itself, so that both non-environmental objects and environmental objects exist. Access Software is therefore an environmental object which per default is an intellectual entity. The semantic unit "1.9 environmentFunction" is conceived to describe the environment object(s) with different levels of granularity. It is suggested to use the vocabulary from Library of Congress[^53]. The semantic unit "1.10 environmentDesignation" is used for information identifying the environment by using human-readable language which can be expected to be understood outside of a digital repository.

[^53]: Library of Congress. environmentFunctionType. Retrieved the 18th of January 2017 at: Environment Function Type [[http://id.loc.gov/vocabulary/preservation/environmentFunctionType.html]{.underline}](http://id.loc.gov/vocabulary/preservation/environmentFunctionType.html)

See the example which follows this vocabulary:

**Table 12 - Recording of Access Software**
```xml
<object xsi:type="intellectualEntity">
     <objectIdentifier>
         <objectIdentifierType>local</objectIdentifierType>
         <objectIdentifierValue>DBVTK</objectIdentifierValue>
     </objectIdentifier>
     <environmentFunction>
         <environmentFunctionType>software</environmentFunctionType>
         <environmentFunctionLevel>1</environmentFunctionLevel>
     </environmentFunction>
     <environmentFunction>
         <environmentFunctionType>software application</environmentFunctionType>
         <environmentFunctionLevel>2</environmentFunctionLevel>
     </environmentFunction>
    <environmentDesignation>
	<environmentName>Database Visualization Toolkit</environmentName>
	<environmentVersion>2.4.1</environmentVersion>
	<environmentDesignationNote>Lightweight web viewer for relational databases, specially if preserved in SIARD 2, that uses SOLR as a backend, and allows browsing, search, and export. Documentation at github.com/eark-project/software/DBVTK</environmentDesignationNote>
	</environmentDesignation>
</object>
```

###### ​3.1.2.2.1.3​ Description 3 - The recording of the relation between the representations and the Access Software

In order to establish a connection between the DIP representation format to be rendered and the Access

Software to render it, it is necessary to use the semantic unit "1.13 relationship". The relationship element can bind both non-environmental objects together with environmental objects and it can bind environmental objects together with other environmental objects. The following example shows how the DIP representation format from Table 11 can be related to the Access Software from Table 12:

**Table 13 - Recording of Access Software**
```xml
<object xsi:type="representation">   
   <objectIdentifier> 
      <objectIdentifierType>filepath</objectIdentifierType>
      <objectIdentifierValue>xlink:href="representations\AVID.SA.18006.rep0"</objectIdentifierValue>         
   </objectIdentifier>
   <significantProperties>
      <significantPropertiesType>DIP representation format</significantPropertiesType>
      <significantPropertiesValue>SIARD2</significantPropertiesValue>
   </significantProperties>
   <!-- The following is the relation between the software and the DIP representation --> 
   <relationship>
       <relationshipType>dependency</relationshipType> 
       <relationshipSubType>requires</relationshipSubType>
       <relatedObjectIdentifier>
           <relatedObjectIdentifierType>local</relatedObjectIdentifierType>
           <relatedObjectIdentifierValue>DBVTK</relatedObjectIdentifierValue>
         </relatedObjectIdentifier>
       <relatedEnvironmentPurpose>render</relatedEnvironmentPurpose> 
   </relationship>
</object>
```

As can be seen in Table 13 (above) the nature of the relationship, \<relationshipType\> is used (value, e.g. 'dependency'); intimately linked to this is also the indication of a \<relationshipSubType\>, e.g. 'requires'.

In order to identify the Access Software, which is used to render the representation, the \<relatedObjectIdentifier\> is employed; and the \<relatedEnvironmentPurpose\> gives us a hint about what the purpose is (here: to 'render').

Since it is not always possible to render the DIP representation formats with one piece of Access Software, it can be necessary to model software dependencies and sequences between several pieces of software in PREMIS.