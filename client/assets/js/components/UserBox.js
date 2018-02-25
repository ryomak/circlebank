import React from 'react'
import LikePage from './LikePage'
import UserEventPage from './UserEventPage'
import {Col} from "react-bootstrap"
import Paper from 'material-ui/Paper';
import {connect} from 'react-redux'
const UserBox = ({data}) => {
  return(
    <div>
        <div className="centerPosition">
          <h3>{`${data.name}さんのお気に入りサークル`}</h3>
        </div>
        <div className="pad">
          <LikePage/>
          <UserEventPage/>
        </div>
    </div>
  )
}

export default UserBox
