import React from 'react';
import { requireNativeComponent, StyleSheet } from 'react-native';

const FeedAdComponent = requireNativeComponent('FeedAd');

console.log('FeedAdComponent', FeedAdComponent);

interface Props {
    codeid: string;
    adWidth?: number;
    visible?: boolean;
    onAdLayout?: Function;
    onAdError?: Function;
    onAdClose?: Function;
    onAdClick?: Function;
}

const FeedAd = (props: Props) => {
    const { codeid, adWidth = 150, onAdLayout, onAdError, onAdClose, onAdClick } = props;
    // let [visible, setVisible] = useState(true);
    // 状态交友父组件来控制，使得广告显示状态在父组件中可以实时监听
    const { visible = true } = props;
    const [height, setHeight] = React.useState(0); // 默认高度
    if (!visible) return null;
    return (
        <FeedAdComponent
            codeid={codeid}
            adWidth={adWidth}
            style={{ width: adWidth, height }}
            onAdError={(e: any) => {
                onAdError && onAdError(e.nativeEvent);
            }}
            onAdClick={(e: any) => {
                onAdClick && onAdClick(e.nativeEvent);
            }}
            onAdClose={(e: any) => {
                onAdClose && onAdClose(e.nativeEvent);
            }}
            onAdLayout={(e: any) => {
                if (e.nativeEvent.height) {
                    setHeight(e.nativeEvent.height);
                    onAdLayout && onAdLayout(e.nativeEvent);
                }
            }}
        />
    );
};

export default FeedAd;
