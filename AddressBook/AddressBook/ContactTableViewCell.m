//
//  ContactTableViewCell.m
//  AddressBook
//
//  Created by Alexey Belkevich on 1/10/14.
//  Copyright (c) 2014 alterplay. All rights reserved.
//

#import "ContactTableViewCell.h"
#import "APContact.h"

@interface ContactTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *photoView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *companyLabel;
@property (weak, nonatomic) IBOutlet UILabel *phonesLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailsLabel;
@end

@implementation ContactTableViewCell

#pragma mark - life cycle

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return self;
}

#pragma mark - table view model transfer implementation

- (void)updateWithModel:(id)model
{
    APContact *contact = model;
    self.nameLabel.text = [self contactName:contact];
    self.companyLabel.text = contact.company ?: @"(No company)";
    self.phonesLabel.text = [self contactPhones:contact];
    self.emailsLabel.text = [self contactEmails:contact];
    self.photoView.image = contact.thumbnail ?: [UIImage imageNamed:@"no_photo"];
}

#pragma mark - private

- (NSString *)contactName:(APContact *)contact
{
    if (contact.firstName && contact.lastName)
    {
        return [NSString stringWithFormat:@"%@ %@ (%@ %@)", contact.firstName, contact.lastName, contact.firstNamePhonetic, contact.lastNamePhonetic];
    }
    else if (contact.firstName || contact.lastName)
    {
        return contact.firstName ?: contact.lastName;
    }
    else
    {
        return @"Untitled contact";
    }
}

- (NSString *)contactPhones:(APContact *)contact
{
    if (contact.phones.count > 1)
    {
        return [contact.phones componentsJoinedByString:@", "];
    }
    else
    {
        return contact.phones.firstObject ?: @"(No phones)";
    }
}

- (NSString *)contactEmails:(APContact *)contact
{
    if (contact.emails.count > 1)
    {
        return [contact.emails componentsJoinedByString:@", "];
    }
    else
    {
        return contact.emails.firstObject ?: @"(No emails)";
    }
}

@end
