pragma solidity >=0.5.0 <0.9.0;
pragma experimental ABIEncoderV2;

contract Twitter{
    struct Reply{
        address author;
        string content;
        uint timestamp;
    }
    struct Tweet{
        address author;
        string content;
        uint likeCount;
        address[] likes;
        Reply[] replies;
    }
    struct User{
        address userAddress;
        uint id;
        string fullname;
        uint[] tweets;
    }
    
    uint public userCount = 0;
    mapping(address => User) users;
    uint public tweetCount = 0;
    mapping(uint => Tweet) tweets;
    
    function userExists(address _addr) public view returns(bool){
        return bytes(users[_addr].fullname).length > 0;
    }
    
    function _checkLength(string memory _str) internal view returns(bool){
        return bytes(_str).length>0;
    }
    
    function createUser(string calldata _fullname) external {
        require(userExists(msg.sender)==false, "User already exists!");
        require(_checkLength(_fullname), "Fullname can't be empty!");
        userCount+=1;
        users[msg.sender].userAddress =  msg.sender;
        users[msg.sender].id= userCount;
        users[msg.sender].fullname = _fullname;
    }
    
    function newTweet(string memory _content) public {
        require(userExists(msg.sender), "User doesn't exists!");
        require(_checkLength(_content), "Tweet content can't be empty!");
        tweets[tweetCount].author = msg.sender;
        tweets[tweetCount].content = _content;
        tweets[tweetCount].likeCount = 0;
        users[msg.sender].tweets.push(tweetCount);
        tweetCount++;
    }
    
    // function newReply(uint _tweetId, string memory _content){
        
    // }
    
    function getAllTweets() public view returns(Tweet[] memory){
        Tweet[] memory tmp = new Tweet[](tweetCount);
        uint i=0;
        for(i; i<tweetCount; i++){
            tmp[i]=tweets[i];
        }
        return tmp;
    }
    
    function getTweetsByUser(address _user) public view returns(Tweet[] memory){
        require(userExists(_user), "User doesn't exists!");
        Tweet[] memory tmp = new Tweet[](users[_user].tweets.length);
        uint i=0;
        for(i; i<users[_user].tweets.length; i++){
            tmp[i] = tweets[users[_user].tweets[i]];
        }
        return tmp;
    }
    
    
}