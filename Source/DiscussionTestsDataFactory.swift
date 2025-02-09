//
//  DiscussionTestsDataFactory.swift
//  edX
//
//  Created by Saeed Bashir on 2/25/16.
//  Copyright © 2016 edX. All rights reserved.
//

@testable import edX
import UIKit
import XCTest

class DiscussionTestsDataFactory: NSObject {
    
    static let thread = DiscussionThread(
        threadID: "123",
        type: .Discussion,
        courseId: "some-course",
        topicId: "abc",
        groupId: nil,
        groupName: nil,
        title: "Some Post",
        rawBody: "Lorem ipsum dolor sit amet",
        renderedBody: "<p>Lorem ipsum dolor sit amet</p>",
        author: "Test Person",
        authorLabel: "Staff",
        commentCount: 0,
        commentListUrl: nil,
        hasEndorsed: false,
        pinned: false,
        closed: false,
        following: false,
        flagged: false,
        abuseFlagged: false,
        voted: true,
        voteCount: 4,
        createdAt: NSDate.stableTestDate(),
        updatedAt: nil,
        editableFields: nil,
        read: true,
        unreadCommentCount: 0,
        responseCount: 0)
    
    static let unendorsedComment = DiscussionComment(
        commentID: "123",
        parentID: "123",
        threadID: "345",
        rawBody: "Lorem ipsum dolor sit amet",
        renderedBody: "<p>Lorem ipsum dolor sit amet</p>",
        author: "Test Person",
        authorLabel: nil,
        voted: true,
        voteCount: 10,
        createdAt: NSDate.stableTestDate(),
        updatedAt: nil,
        endorsed: false,
        endorsedBy: nil,
        endorsedByLabel: nil,
        endorsedAt: nil,
        flagged: false,
        abuseFlagged: false,
        editableFields: nil,
        childCount: 0)
    
    static let unendorsedComment1 = DiscussionComment(
        commentID: "124",
        parentID: "124",
        threadID: "345",
        rawBody: "Lorem ipsum dolor sit amet",
        renderedBody: "<p>Lorem ipsum dolor sit amet</p>",
        author: "Test Person",
        authorLabel: nil,
        voted: true,
        voteCount: 10,
        createdAt: NSDate.stableTestDate(),
        updatedAt: nil,
        endorsed: false,
        endorsedBy: nil,
        endorsedByLabel: nil,
        endorsedAt: nil,
        flagged: false,
        abuseFlagged: false,
        editableFields: nil,
        childCount: 5)
    
    static let endorsedComment = DiscussionComment(
        commentID: "125",
        parentID: "125",
        threadID: "345",
        rawBody: "Lorem ipsum dolor sit amet",
        renderedBody: "<p>Lorem ipsum dolor sit amet</p>",
        author: "Test Person",
        authorLabel: nil,
        voted: false,
        voteCount: 10,
        createdAt: NSDate.stableTestDate(),
        updatedAt: nil,
        endorsed: true,
        endorsedBy: "Test Person 2",
        endorsedByLabel: nil,
        endorsedAt: NSDate.stableTestDate(),
        flagged: false,
        abuseFlagged: false,
        editableFields: nil,
        childCount: 0)
    
    static let endorsedComment1 = DiscussionComment(
        commentID: "126",
        parentID: nil,
        threadID: "345",
        rawBody: "Lorem ipsum dolor sit amet",
        renderedBody: "<p>Lorem ipsum dolor sit amet</p>",
        author: "Test Person",
        authorLabel: nil,
        voted: true,
        voteCount: 10,
        createdAt: NSDate.stableTestDate(),
        updatedAt: nil,
        endorsed: false,
        endorsedBy: nil,
        endorsedByLabel: "Test Person 2",
        endorsedAt: NSDate.stableTestDate(),
        flagged: false,
        abuseFlagged: false,
        editableFields: nil,
        childCount: 2)
    
    static func unendorsedResponses()-> [DiscussionComment] {
        return [unendorsedComment, unendorsedComment1]
    }
    
    static func endorsedResponses() -> [DiscussionComment] {
        return [endorsedComment, endorsedComment1]
    }
}
