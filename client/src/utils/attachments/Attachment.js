import React from "react";

const TYPES = {
    VIDEO: 'VIDEO',
    IMAGE: 'IMAGE',
    PDF: 'PDF'
}

class Attachment extends React.Component{
    
    render(){
        const {type, src, className} = this.props;

        switch(type){
            case TYPES.IMAGE : 
                return <img 
                    src={src}
                    className={className}
                />
                break;
            case TYPES.VIDEO : 
                const {mimeType} = this.props;
                return mimeType && <video 
                    className={className}
                    controls
                >
                    <source 
                        src={src}
                        type={mimeType}
                    />
                </video>
                break;
            case TYPES.PDF : 

                break;
            default : return null;
        }
    }
}

export default Attachment