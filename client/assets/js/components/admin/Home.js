import React,{Component} from 'react'
import {Link,withRouter} from 'react-router-dom'
import {Button,Col} from 'react-bootstrap'
import {connect} from 'react-redux';
import Paper from 'material-ui/Paper';
import FlatButton from 'material-ui/FlatButton';
import FontIcon from 'material-ui/FontIcon';
import IconButton from 'material-ui/IconButton';
import AddButton from 'material-ui/svg-icons/content/add';
import {adminGetCircle,adminDeleteCircle} from '../../actions/index'

class Home extends Component{
  componentDidMount(){
    this.props.getCircle();
  }
  handleClick(event,name){
    event.preventDefault();
    this.props.history.push(`/admin/event/${name}`)
  }
  handleClick1(event,id,name){
    event.preventDefault();
    this.props.DeleteCircle(id)
    this.props.history.push(`/admin/delete/${name}`)
  }

  handleClick2(event,id,url){
    event.preventDefault();
    this.props.history.push(`/admin/image/${url}/${id}`)
  }
  handleClick3(e){
    e.preventDefault();
    this.props.history.push(`/admin/add/circle`)
  }
  render(){
    return(
        <div>
        <Col smOffset={2} sm={8}>
        <div className="adminHome">
        <span className="fontChange adminHome1">サークル一覧</span>
        <span className="addButton">
          <IconButton onClick={this.handleClick3.bind(this)} >
            <AddButton/>
          </IconButton>
        </span>
        </div>
        {this.props.circles.circle.map( circle => (
          <div key={circle.id} className="padbottom">
          <Paper zDepth={1} className="padZero">
            <div className="commentbox">
            <Link to={`/admin/circle/${circle.url_name}`}　 style={{ textDecoration: 'none' ,color:'white'}}><span className="adminFont">{circle.name}</span></Link>
              <span className="floatright">
              <FlatButton onClick={(event)=>this.handleClick2(event,circle.id,circle.url_name)} >サークル画像追加</FlatButton>
              <FlatButton onClick={(event)=>this.handleClick(event,circle.url_name)} >イベント編集</FlatButton>
              <FlatButton onClick={(event)=>this.handleClick1(event,circle.id,circle.url_name)} >削除</FlatButton>
              </span>
            </div>
            <div className="eventbox">
              <p>サークル種類</p>
              <p>{circle.introduction}</p>
            </div>
          </Paper>
          </div>
        ))}
        </Col>
        </div>
      )
  }
}
const  mapStateToProps = state => {

  return{
    circles: state.adminCircle
  }
}
const mapDispatchToProps = dispatch => {
  return{
      getCircle:() => {
        dispatch(adminGetCircle())
      },
      DeleteCircle:(id)=>{
        dispatch(adminDeleteCircle(id))
      }
    }
  }
export default withRouter(connect(mapStateToProps, mapDispatchToProps)(Home))
