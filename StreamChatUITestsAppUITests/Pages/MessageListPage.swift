//
// Copyright © 2022 Stream.io Inc. All rights reserved.
//

import Foundation
import XCTest

class MessageListPage {
    
    static var cells: XCUIElementQuery {
        app.cells.matching(NSPredicate(format: "identifier LIKE 'ChatMessageCell'"))
    }
    
    enum NavigationBar {
        
        static var header: XCUIElement { app.otherElements["ChatChannelHeaderView"] }
        
        static var chatAvatar: XCUIElement {
            app.otherElements["ChatAvatarView"].images.firstMatch
        }
        
        static var chatName: XCUIElement {
            app.staticTexts.firstMatch
        }
        
        static var participants: XCUIElement {
            app.staticTexts.lastMatch!
        }
    }
    
    enum Composer {
        static var sendButton: XCUIElement { app.buttons["SendButton"] }
        static var confirmButton: XCUIElement { app.buttons["ConfirmButton"] }
        static var attachmentButton: XCUIElement { app.buttons["AttachmentButton"] }
        static var commandButton: XCUIElement { app.buttons["CommandButton"] }
        static var inputField: XCUIElement { app.otherElements["InputChatMessageView"] }
    }
    
    enum Reactions {
        static var lol: XCUIElement { reaction(label: "reaction lol big") }
        static var like: XCUIElement { reaction(label: "reaction thumbsup big") }
        static var love: XCUIElement { reaction(label: "reaction love big") }
        static var sad: XCUIElement { reaction(label: "reaction thumbsdown big") }
        static var wow: XCUIElement { reaction(label: "reaction wut big") }
        
        private static var id = "ChatMessageReactionItemView"
        
        private static func reaction(label: String) -> XCUIElement {
            let predicate = NSPredicate(
                format: "identifier LIKE '\(id)' AND label LIKE '\(label)'"
            )
            return app.buttons.matching(predicate).firstMatch
        }
    }
    
    enum ContextMenu {
        static var reactionsView: XCUIElement { app.otherElements["ChatReactionPickerReactionsView"] }
        static var reply: XCUIElement { app.otherElements["InlineReplyActionItem"] }
        static var threadReply: XCUIElement { app.otherElements["ThreadReplyActionItem"] }
        static var copy: XCUIElement { app.otherElements["CopyActionItem"] }
        static var flag: XCUIElement { app.otherElements["FlagActionItem"] }
        static var mute: XCUIElement { app.otherElements["MuteUserActionItem"] }
        static var unmute: XCUIElement { app.otherElements["UnmuteUserActionItem"] }
        static var edit: XCUIElement { app.otherElements["EditActionItem"] }
        static var delete: XCUIElement { app.otherElements["DeleteActionItem"] }
        static var resend: XCUIElement { app.otherElements["ResendActionItem"] }
        static var block: XCUIElement { app.otherElements["BlockUserActionItem"] }
        static var unblock: XCUIElement { app.otherElements["UnblockUserActionItem"] }
    }
    
    enum Attributes {
        static func reactionButton(messageCell: XCUIElement) -> XCUIElement {
            messageCell.buttons["ChatMessageReactionItemView"]
        }
        
        static func threadButton(messageCell: XCUIElement) -> XCUIElement {
            messageCell.buttons["threadReplyCountButton"]
        }
        
        static func time(messageCell: XCUIElement) -> XCUIElement {
            messageCell.staticTexts["timestampLabel"]
        }
        
        static func author(messageCell: XCUIElement) -> XCUIElement {
            messageCell.staticTexts["authorNameLabel"]
        }
        
        static func text(messageCell: XCUIElement) -> XCUIElement {
            messageCell.textViews["textView"]
        }
        
        static func quotedText(_ text: String, messageCell: XCUIElement) -> XCUIElement {
            messageCell.textViews.matching(NSPredicate(format: "value LIKE '\(text)'")).firstMatch
        }
        
        static func deletedIcon(messageCell: XCUIElement) -> XCUIElement {
            messageCell.images["onlyVisibleForYouIconImageView"]
        }
        
        static func deletedLabel(messageCell: XCUIElement) -> XCUIElement {
            messageCell.staticTexts["onlyVisibleForYouLabel"]
        }
        
    }
    
    enum PopUpButtons {
        static var cancel: XCUIElement {
            app.scrollViews.buttons.matching(NSPredicate(format: "label LIKE 'Cancel'")).firstMatch
        }
        
        static var delete: XCUIElement {
            app.scrollViews.buttons.matching(NSPredicate(format: "label LIKE 'Delete'")).firstMatch
        }
    }
    
    enum AttachmentMenu {
        static var fileButton: XCUIElement {
            app.scrollViews.buttons.matching(NSPredicate(format: "label LIKE 'File'")).firstMatch
        }
        
        static var photoOrVideoButton: XCUIElement {
            app.scrollViews.buttons.matching(NSPredicate(format: "label LIKE 'Photo or Video'")).firstMatch
        }
        
        static var cancelButton: XCUIElement {
            app.scrollViews.buttons.matching(NSPredicate(format: "label LIKE 'Cancel'")).firstMatch
        }
    }
    
    enum ComposerCommands {
        static var cells: XCUIElementQuery {
            app.cells.matching(NSPredicate(format: "identifier LIKE 'ChatCommandSuggestionCollectionViewCell'"))
        }
        
        static var headerTitle: XCUIElement {
            app.otherElements["ChatSuggestionsHeaderView"].staticTexts.firstMatch
        }
        
        static var headerImage: XCUIElement {
            app.otherElements["ChatSuggestionsHeaderView"].images.firstMatch
        }
        
        static var giphyImage: XCUIElement {
            app.images["command_giphy"]
        }
    }
    
}