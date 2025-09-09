# Sample Data

This document provides sample data for creating a benefit in the UBI Strapi Provider catalog manager.

## Example Benefit Creation JSON

```json
{
    "data": {
        "id": 10,
        "documentId": "u1cfo1n5ysbwuk63nz70gro2",
        "title": "[RM] [Tekdi Test 4] ADIP - Assistance To Disabled Persons For Purchase/Fitting Of Aids/Appliances",
        "category": "education-and-learning",
        "subCategory": "scholarship",
        "applicationOpenDate": "2025-06-01",
        "applicationCloseDate": "2025-10-31",
        "imageUrl": null,
        "shortDescription": "The ADIP Scheme provides free or subsidised modern aids and assistive devices to persons with disabilities to enhance their mobility and independent living. It covers items like hearing aids, prosthetics, wheelchairs, and cochlear implants, based on need and income eligibility.",
        "shortDescription_md": null,
        "longDescription": "The ADIP Scheme provides free or subsidised modern aids and assistive devices to persons with disabilities to enhance their mobility and independent living. It covers items like hearing aids, prosthetics, wheelchairs, and cochlear implants, based on need and income eligibility.",
        "longDescription_md": null,
        "createdAt": "2025-06-12T06:26:00.108Z",
        "updatedAt": "2025-09-01T11:33:38.888Z",
        "publishedAt": null,
        "locale": "en",
        "tags": [
            {
                "id": 29,
                "name": "Disability"
            },
            {
                "id": 30,
                "name": "In-kind"
            },
            {
                "id": 31,
                "name": "Assistance Scheme"
            }
        ],
        "benefits": [
            {
                "__component": "benefit.non-monetary-benefit",
                "id": 3,
                "title": "Free mobility and other aids",
                "type": "non-monetary",
                "description": "The ADIP Scheme provides free or subsidised modern aids and assistive devices to persons with disabilities to enhance their mobility and independent living. It covers items like hearing aids, prosthetics, wheelchairs, and cochlear implants, based on need and income eligibility.",
                "description_md": null
            }
        ],
        "exclusions": [
            {
                "id": 19,
                "description": "Sibling Restriction - Max 2 siblings eligible (both if twins)",
                "description_md": null
            },
            {
                "id": 20,
                "description": "Limit on Family Beneficiaries - No more than two children from same parents allowed; twins exception",
                "description_md": null
            },
            {
                "id": 21,
                "description": "False Information Penalty - Penalty for false document submission",
                "description_md": null
            },
            {
                "id": 22,
                "description": "Course Change Restriction - Change of course post-sanction allowed?",
                "description_md": null
            },
            {
                "id": 23,
                "description": "Repeating Class Restriction - Scholarship disallowed if repeating class",
                "description_md": null
            }
        ],
        "references": [],
        "providingEntity": {
            "id": 11,
            "name": "Ministry of Social Justice and Empowerment",
            "type": "government",
            "department": "Department of Empowerment of Persons with Disabilities (DEPwD)",
            "address": {
                "id": 21,
                "street": "5th Floor, Antyodaya Bhawan, CGO Complex, Lodhi Road",
                "city": "New Delhi",
                "state": "Delhi",
                "postalCode": "110003"
            },
            "contactInfo": {
                "id": 21,
                "phoneNumber": "24365019",
                "email": "depwd@gov.in"
            }
        },
        "sponsoringEntities": [
            {
                "id": 11,
                "name": "Ministry of Social Justice and Empowerment",
                "type": "government",
                "department": "Department of Empowerment of Persons with Disabilities (DEPwD)",
                "sponsorShare": "100",
                "address": {
                    "id": 22,
                    "street": "5th Floor, Antyodaya Bhawan, CGO Complex, Lodhi Road",
                    "city": "New Delhi",
                    "state": "Delhi",
                    "postalCode": "110003"
                },
                "contactInfo": {
                    "id": 22,
                    "phoneNumber": "24365019",
                    "email": "depwd@gov.in"
                }
            }
        ],
        "eligibility": [
            {
                "id": 30,
                "evidence": "disabilityType",
                "type": "health",
                "description": "The applicant must have disability type as certified by competent medical authority",
                "allowedProofs": [
                    "disabilityCertificate"
                ],
                "criteria": {
                    "id": 30,
                    "name": "disabilityType",
                    "condition": "in",
                    "conditionValues": [
                        "acid_attack_victim",
                        "autism_spectrum_disorder",
                        "blindness",
                        "cerebral_palsy",
                        "chronic_neurological_conditions",
                        "deaf",
                        "dwarfism",
                        "hard_of_hearing",
                        "hearing_impairment",
                        "hemophilia",
                        "intellectual_disability",
                        "leprosy_cured",
                        "locomotor_disability",
                        "low_vision",
                        "mental_illness",
                        "mental_retardation",
                        "multiple_disabilities",
                        "multiple_disabilities_including_deaf_blindness",
                        "multiple_sclerosis",
                        "muscular_dystrophy",
                        "parkinson_s_disease",
                        "sickle_cell_disease",
                        "specific_learning_disability",
                        "speech_and_language_disability",
                        "thalassemia"
                    ]
                }
            },
            {
                "id": 31,
                "evidence": "disabilityRange",
                "type": "health",
                "description": "The applicant must have 40% or more disability as certified by competent medical authority",
                "allowedProofs": [
                    "disabilityCertificate"
                ],
                "criteria": {
                    "id": 31,
                    "name": "disabilityRange",
                    "condition": "greater than equals",
                    "conditionValues": [
                        "40"
                    ]
                }
            },
            {
                "id": 32,
                "evidence": "annualIncome",
                "type": "economic",
                "description": "The Total Annual income of parents/guardians of the applicant must not exceed ₹22500/month (i.e. ₹2.7 Lakh per Annum)",
                "allowedProofs": [
                    "incomeCertificate"
                ],
                "criteria": {
                    "id": 32,
                    "name": "annualIncome",
                    "condition": "less than equals",
                    "conditionValues": [
                        "270000"
                    ]
                }
            }
        ],
        "documents": [
            {
                "id": 45,
                "documentType": "idProof",
                "isRequired": true,
                "allowedProofs": [
                    "otrCertificate"
                ]
            },
            {
                "id": 46,
                "documentType": "disabilityProof",
                "isRequired": true,
                "allowedProofs": [
                    "disabilityCertificate"
                ]
            },
            {
                "id": 47,
                "documentType": "incomeProof",
                "isRequired": true,
                "allowedProofs": [
                    "incomeCertificate"
                ]
            },
            {
                "id": 48,
                "documentType": "selfDeclarationProof",
                "isRequired": false,
                "allowedProofs": [
                    "selfDeclarationForm"
                ]
            },
            {
                "id": 299,
                "documentType": "bankAccountProof",
                "isRequired": false,
                "allowedProofs": [
                    "bankAccountDetails"
                ]
            }
        ],
        "applicationProcess": {
            "id": 11,
            "mode": "online",
            "description": "Submit online"
        },
        "applicationForm": [
            {
                "id": 118,
                "fieldsGroupName": "PersonalInfo",
                "fieldsGroupLabel": "Personal Info",
                "fields": [
                    {
                        "id": 1203,
                        "name": "firstName",
                        "type": "text",
                        "label": "First Name",
                        "required": true,
                        "multiple": null,
                        "options": []
                    },
                    {
                        "id": 1204,
                        "name": "middleName",
                        "type": "text",
                        "label": "Middle Name",
                        "required": false,
                        "multiple": null,
                        "options": []
                    },
                    {
                        "id": 1205,
                        "name": "lastName",
                        "type": "text",
                        "label": "Last Name",
                        "required": true,
                        "multiple": null,
                        "options": []
                    },
                    {
                        "id": 1210,
                        "name": "gender",
                        "type": "select",
                        "label": "Gender",
                        "required": true,
                        "multiple": null,
                        "options": [
                            {
                                "id": 1231,
                                "label": "Male",
                                "value": "male"
                            },
                            {
                                "id": 1232,
                                "label": "Female",
                                "value": "female"
                            }
                        ]
                    },
                    {
                        "id": 1211,
                        "name": "dob",
                        "type": "text",
                        "label": "Date of Birth",
                        "required": true,
                        "multiple": null,
                        "options": []
                    },
                    {
                        "id": 1317,
                        "name": "age",
                        "type": "text",
                        "label": "Age",
                        "required": false,
                        "multiple": null,
                        "options": []
                    }
                ]
            },
            {
                "id": 119,
                "fieldsGroupName": "ContactAndIdentityInfo",
                "fieldsGroupLabel": "Contact and Identity Info",
                "fields": [
                    {
                        "id": 1206,
                        "name": "nspOtr",
                        "type": "text",
                        "label": "NSP OTR (One Time Registration)",
                        "required": true,
                        "multiple": null,
                        "options": []
                    },
                    {
                        "id": 1207,
                        "name": "phoneNumber",
                        "type": "text",
                        "label": "Phone Number",
                        "required": true,
                        "multiple": null,
                        "options": []
                    },
                    {
                        "id": 1208,
                        "name": "aadhaar",
                        "type": "text",
                        "label": "Aadhaar Number",
                        "required": true,
                        "multiple": null,
                        "options": []
                    }
                ]
            },
            {
                "id": 121,
                "fieldsGroupName": "DisabilityInfo",
                "fieldsGroupLabel": "Disability Info",
                "fields": [
                    {
                        "id": 1213,
                        "name": "disabilityType",
                        "type": "select",
                        "label": "Disability Type",
                        "required": true,
                        "multiple": null,
                        "options": [
                            {
                                "id": 1233,
                                "label": "Acid Attack Victim",
                                "value": "acid_attack_victim"
                            },
                            {
                                "id": 1234,
                                "label": "Autism Spectrum Disorder",
                                "value": "autism_spectrum_disorder"
                            },
                            {
                                "id": 1235,
                                "label": "Blindness",
                                "value": "blindness"
                            },
                            {
                                "id": 1236,
                                "label": "Cerebral Palsy",
                                "value": "cerebral_palsy"
                            },
                            {
                                "id": 1237,
                                "label": "Chronic Neurological Conditions",
                                "value": "chronic_neurological_conditions"
                            },
                            {
                                "id": 1238,
                                "label": "Deaf",
                                "value": "deaf"
                            },
                            {
                                "id": 1239,
                                "label": "Deafness",
                                "value": "deafness"
                            },
                            {
                                "id": 1240,
                                "label": "Dwarfism",
                                "value": "dwarfism"
                            },
                            {
                                "id": 1241,
                                "label": "Hard of Hearing",
                                "value": "hard_of_hearing"
                            },
                            {
                                "id": 1242,
                                "label": "Hearing Impairment",
                                "value": "hearing_impairment"
                            },
                            {
                                "id": 1243,
                                "label": "Hemophilia",
                                "value": "hemophilia"
                            },
                            {
                                "id": 1244,
                                "label": "Intellectual Disability",
                                "value": "intellectual_disability"
                            },
                            {
                                "id": 1245,
                                "label": "Leprosy Cured",
                                "value": "leprosy_cured"
                            },
                            {
                                "id": 1246,
                                "label": "Locomotor Disability",
                                "value": "locomotor_disability"
                            },
                            {
                                "id": 1247,
                                "label": "Low Vision",
                                "value": "low_vision"
                            },
                            {
                                "id": 1248,
                                "label": "Mental Illness",
                                "value": "mental_illness"
                            },
                            {
                                "id": 1249,
                                "label": "Multiple Disabilities",
                                "value": "multiple_disabilities"
                            },
                            {
                                "id": 1250,
                                "label": "Multiple Sclerosis",
                                "value": "multiple_sclerosis"
                            },
                            {
                                "id": 1251,
                                "label": "Muscular Dystrophy",
                                "value": "muscular_dystrophy"
                            },
                            {
                                "id": 1252,
                                "label": "Parkinsons Disease",
                                "value": "parkinsons_disease"
                            },
                            {
                                "id": 1253,
                                "label": "Sickle Cell Disease",
                                "value": "sickle_cell_disease"
                            },
                            {
                                "id": 1254,
                                "label": "Specific Learning Disability",
                                "value": "specific_learning_disability"
                            },
                            {
                                "id": 1255,
                                "label": "Speech and Language Disability",
                                "value": "speech_language_disability"
                            },
                            {
                                "id": 1256,
                                "label": "Thalassemia",
                                "value": "thalassemia"
                            }
                        ]
                    },
                    {
                        "id": 1214,
                        "name": "disabilityRange",
                        "type": "text",
                        "label": "Disability Range",
                        "required": true,
                        "multiple": null,
                        "options": []
                    },
                    {
                        "id": 1571,
                        "name": "udid",
                        "type": "text",
                        "label": "UDID Number",
                        "required": true,
                        "multiple": null,
                        "options": []
                    }
                ]
            },
            {
                "id": 122,
                "fieldsGroupName": "otherDetails",
                "fieldsGroupLabel": "Other Details",
                "fields": [
                    {
                        "id": 1215,
                        "name": "currentlyEnrolledInOtherGovtScheme",
                        "type": "select",
                        "label": "Are you currently enrolled in another Govt scheme?",
                        "required": true,
                        "multiple": null,
                        "options": [
                            {
                                "id": 1257,
                                "label": "Yes",
                                "value": "yes"
                            },
                            {
                                "id": 1258,
                                "label": "No",
                                "value": "no"
                            }
                        ]
                    },
                    {
                        "id": 1216,
                        "name": "haveTwoOfYourDifferentlyAbledSiblingsAvailedThisScholarship",
                        "type": "select",
                        "label": "Have two of your differently-abled siblings already availed this scholarship?",
                        "required": true,
                        "multiple": null,
                        "options": [
                            {
                                "id": 1259,
                                "label": "Yes",
                                "value": "yes"
                            },
                            {
                                "id": 1260,
                                "label": "No",
                                "value": "no"
                            }
                        ]
                    },
                    {
                        "id": 1217,
                        "name": "selfDeclarationForm",
                        "type": "text",
                        "label": "Self Declaration Form",
                        "required": false,
                        "multiple": null,
                        "options": []
                    },
                    {
                        "id": 1588,
                        "name": "annualIncome",
                        "type": "text",
                        "label": "Annual Income",
                        "required": true,
                        "multiple": null,
                        "options": []
                    }
                ]
            }
        ],
        "benefitCalculationRules": [],
        "createdBy": {
            "id": 2,
            "firstname": "Tekdi",
            "lastname": "Provider",
            "username": null
        },
        "updatedBy": {
            "id": 1,
            "firstname": "Strapi",
            "lastname": "Admin",
            "username": null
        },
        "localizations": [],
        "status": "published"
    },
    "meta": {
        "availableLocales": [],
        "availableStatus": [
            {
                "id": 141,
                "locale": "en",
                "updatedAt": "2025-09-01T11:33:38.888Z",
                "createdAt": "2025-06-12T06:26:00.108Z",
                "publishedAt": "2025-09-01T11:33:39.672Z",
                "createdBy": {
                    "id": 2,
                    "firstname": "Tekdi",
                    "lastname": "Provider",
                    "username": null
                },
                "updatedBy": {
                    "id": 1,
                    "firstname": "Manoj",
                    "lastname": "L",
                    "username": null
                }
            }
        ]
    }
}
```

## Notes

1. This sample represents a complete benefit creation payload for the ADIP scheme
2. Use this as a reference for creating benefits in the Strapi catalog manager
3. Ensure all required fields are properly filled before submission
4. Replace IDs with appropriate values from your system
