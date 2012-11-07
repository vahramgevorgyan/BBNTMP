import bb.cascades 1.0

import bb.multimedia 1.0

Page {
    Container {
        id: appContainer
        background: Color.create("#ff262626")
        
        layout: DockLayout {
        }
        
        Container {
            id: contentContainer
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Bottom
            
            layout: AbsoluteLayout {}
            
            layoutProperties: AbsoluteLayoutProperties {
                positionX: 0
                positionY: 0
            }
            
            Container {
                id: buttonContainer
                objectName: buttonContainer
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                
                
                
                leftPadding: 20
                rightPadding: 20
                horizontalAlignment: HorizontalAlignment.Center
                verticalAlignment: VerticalAlignment.Bottom
                
                Button {
                    id:stopButton
                    text: "Stop"
                    
                    onClicked:{
                        videoWindow.visible = false;
                        myPlayer.stop()
                    }
                }
                
                Button {
                    id:previousButton
                    text: "Previous"
                    
                    onClicked:{                        
                        mycppPlayer.playVideo("/accounts/1000/shared/videos/aaa.mp4")
                        videoWindow.visible = true;
                        contentContainer.visible = true;
                    }
                }
                
                Button {
                    id:playButton
                    text: "Play/Pause"
                    
                    onClicked:{
                        myPlayer.setSourceUrl("/accounts/1000/shared/videos/aaa.mp4")
                        if (myPlayer.play() == MediaError.None) {
                          videoWindow.visible = true;
                          contentContainer.visible = true;
                        }
                    }
                }
                
                Button {
                    id:nextButton
                    text: "Next"
                    
                    onClicked:{
                        videoWindow.visible = false;
                        mycppPlayer.stopVideo();
                        }
                }
                
                Button {
                    id:muteButton
                    text: "Mute"
                    
                    onClicked:{}
                }
               
            }//sliderContainer
            Container {
                id:videoContainer
                objectName:"videoContainer"
                layout: AbsoluteLayout {}
                /*Button {
                    text:"video"
                }*/
                
                 Slider {
                                                        id: durationSlider
                                                        objectName: durationSlider
                                                        leftMargin: 20
                                                        rightMargin: 20
                                                        fromValue: 0.0
                                                        toValue: 0.5
                                                        horizontalAlignment: HorizontalAlignment.Fill
                                                        verticalAlignment: VerticalAlignment.Bottom
                                                        
                                                        layoutProperties: StackLayoutProperties {
                                                            spaceQuota: 1
                                                        }
                                                        
                                                        onImmediateValueChanged: {
                                                            // This is where the day-night opacity value is done.
                                                            //todo
                                                        }
                                                    }
                                                    
             /*   ForeignWindowControl {
                    id: videoWindow
                    objectName: "VideoWindow"
                    windowId: "VideoWindow"
                    layoutProperties: AbsoluteLayoutProperties {
                        positionX: 0
                        positionY: 0
                    }
                    preferredWidth: 768
                    preferredHeight: 1280
                    visible:  boundToWindow        
                    updatedProperties: WindowProperty.SourceSize | 
                        WindowProperty.Size |
                        WindowProperty.Position |
                        WindowProperty.Visible                
                    
                    onVisibleChanged: {
                        console.log("foreignwindow visible = " + visible);
                    }
                    onBoundToWindowChanged: {
                        console.log("VideoWindow bound to mediaplayer!");
                    }
                }*/
                
            }//videoContainer
        }//contentContainer
        
        attachedObjects: [
            Sheet {
                id: videoSheet
                objectName: "videoSheet"
                content:Page {
                   
                    
                }
            },
               
               
               MediaPlayer {
                   id: myPlayer
                   // sourceUrl: < Set in the Button control's onClicked event handler. >
                   // Use the device's primary display to
                   // show the video.
                   videoOutput: VideoOutput.PrimaryDisplay
                   
                   // The ID of the ForeignWindow control to
                   // use as the rendering surface.
                   windowId: "VideoWindow"           
               }
               
           /*    CustomDialog {
                   id: myCustomDialog
                   content: Container {
                       Button {
                           text: "Yes"
                           onClicked: myCustomDialog.visible = false
                       }
                       Button {
                           text: "No"
                           onClicked: myCustomDialog.visible = false
                       }
                   }
               }*/
            ] // Attached objects.
    
    }//appContainer
}// Page