import React from "react";
import "./App.css";
import Attachment from "./utils/attachments/Attachment";

class App extends React.Component{

    render(){
        return (
            <div className="container">
                <div className="post">
                    <div className="user-profile">
                        <img 
                            src="https://pbs.twimg.com/profile_images/1433703510374240277/alkZIfph_400x400.jpg"
                        />
                    </div>
                    <div className="body">
                        <div className="user">
                            <span className="fullname">Sameer Kushwaha</span>
                            <span className="username">@kushwahasameer</span>
                            <span className="dot"/>
                            <span className="time">16h</span>
                        </div>
                        <div className="content">
                            I was just told FSD Beta 10.1 is still on track for release later tonight. I still have no word on the Beta Button yet but if I hear anything I’ll let you know.
                        </div>
                        <div className="attachments">
                            <Attachment 
                                type='IMAGE'
                                src="https://pbs.twimg.com/media/FAF74JwUUAQ0-MN?format=jpg&name=small"
                                className='attachments-img-1'
                            />
                            <Attachment 
                                type='VIDEO'
                                src="http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
                                className='attachments-img-1'
                                mimeType='video/mp4'
                            />
                        </div>
                    </div>
                </div>
            </div>
        )
    }
}

export default App