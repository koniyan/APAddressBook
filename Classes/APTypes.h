//
//  APTypes.h
//  AddressBook
//
//  Created by Alexey Belkevich on 1/11/14.
//  Copyright (c) 2014 alterplay. All rights reserved.
//

#ifndef AddressBook_APTypes_h
#define AddressBook_APTypes_h

@class APContact;

typedef enum
{
    APAddressBookAccessUnknown = 0,
    APAddressBookAccessGranted = 1,
    APAddressBookAccessDenied  = 2
} APAddressBookAccess;

typedef BOOL(^APContactFilterBlock)(APContact *contact);

typedef NS_OPTIONS(NSUInteger , APContactField)
{
    APContactFieldFirstName         = 1 << 0,
    APContactFieldLastName          = 1 << 1,
    APContactFieldCompany           = 1 << 2,
    APContactFieldPhones            = 1 << 3,
    APContactFieldEmails            = 1 << 4,
    APContactFieldPhoto             = 1 << 5,
    APContactFieldThumbnail         = 1 << 6,
    APContactFieldFirstNamePhonetic = 1 << 7,
    APContactFieldLastNamePhonetic  = 1 << 8,
    APContactFieldDefault       = APContactFieldFirstName | APContactFieldLastName |
                                  APContactFieldPhones,
    APContactFieldAll           = APContactFieldDefault | APContactFieldCompany |
                                  APContactFieldEmails | APContactFieldPhoto |
                                  APContactFieldThumbnail | APContactFieldFirstNamePhonetic |
                                  APContactFieldLastNamePhonetic
};

#endif
