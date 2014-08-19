//
//  MCBClipBoard.m
//  MasterCB
//
//  Created by Loris D'antonio on 17/08/14.
//  Copyright (c) 2014 Loris D'antonio. All rights reserved.
//

#import "MCBClipBoard.h"

@implementation MCBClipBoard{
    NSInteger changeCount;
    //TODO - da trasferire nella parte pubblic, xk la tabella dovrà essere di 2 colonne (KeyCode| String)
    NSMutableDictionary* clipBoardDict;
    BOOL registerKeyShortcut;
}
//TODO xk il pasteBoard senza _ non va ?

- (id)init
{
    self = [super init];
    if (self) {
        //inizializzo i dati
        _pasteBoard = [NSPasteboard generalPasteboard];
        clipBoardDict = [NSMutableDictionary new];
        registerKeyShortcut = false;
    }
    return self;
}

/**
 @author Loris D'Antonio
 
 @discussion rileva se è il counter della pasteBoard è cambiato, se lo è, allora è stata fatta una copia
 
 @return true   se è stato cambiato il changeCount
         false  nessun cambiamento
 */
- (BOOL)update {

    if ([_pasteBoard changeCount] != changeCount) {
        NSLog(@"Pasteboard has been updated!");
        changeCount = [_pasteBoard changeCount];
        return true;
    }
    return false;
}

/**
 @author Loris D'Antonio
 
 @discussion copia nella pasteBoard il contenuto di stringToWrite
 */
- (BOOL) writeToPasteBoard:(NSString *)stringToWrite
{
    [_pasteBoard declareTypes:[NSArray arrayWithObject:NSPasteboardTypeString ] owner:nil];
    return [_pasteBoard setString:stringToWrite forType:NSPasteboardTypeString ];
}

/**
 @author Loris D'Antonio
 
 @discussion legge e restituisce contenuto nella pasteBoard(formato testo)
 */
- (NSString *) readFromPasteBoard
{
    return [_pasteBoard stringForType:NSStringPboardType];
}

/**
 @author Loris D'Antonio
 
 @discussion aggiunge al dizionario una stringa, che come key conterrà il keyCode del tasto sul quale l'utente vuole memorizzare la stringa
 */
-(void) addToPasteBoard:(NSString *)text withKey:(NSString *)keyCode{
    [clipBoardDict setObject:text forKey:keyCode];
    NSLog(@"Aggiunto al clipBoardDict");
}

/**
 @author Loris D'Antonio
 
 @discussion restituisce la stringa memorizzata nel keyCode passato
 */
-(NSString *)getFromPasteBoard:(NSString *)keyCode{
    return [clipBoardDict objectForKey:keyCode];
}

/**
 @author Loris D'Antonio
 
 @discussion metodo che sta all'ascolto della pressione del tasti.
 Gestione per la memorizzazione delle clip, copia e incolla.
 */
-(void)listenForKey {
    [NSEvent addGlobalMonitorForEventsMatchingMask:NSKeyDownMask handler:^(NSEvent *event)
     {
         //NSUInteger key = 8; // 8 è C
         NSUInteger copy = NSCommandKeyMask | NSShiftKeyMask; //cmd + shift
         NSUInteger paste = NSCommandKeyMask | NSAlternateKeyMask; //cmd + alt
         
         NSLog(@"KeyCode:%hu",[event keyCode]);
         
         if(registerKeyShortcut){
             [self addToPasteBoard:[_pasteBoard stringForType:NSPasteboardTypeString]
                           withKey:[NSString stringWithFormat:@"%hu",[event keyCode]]];
             registerKeyShortcut = false;
         }
         
         if([NSEvent modifierFlags] == paste){
             NSString *text = [self getFromPasteBoard:[NSString stringWithFormat:@"%hu",[event keyCode]]];
             NSLog(@"Caricato :%hu",[event keyCode]);
             [_pasteBoard clearContents];
             [_pasteBoard setString:text forType:NSStringPboardType];
         }
         
         if([NSEvent modifierFlags] == NSCommandKeyMask && [event keyCode] == 8){
             NSLog(@"Sto Copiando !");
             registerKeyShortcut = true;
         }
     }];
}
@end
