%Reassembly Robotics Brain
%(C)Copyright 2014 All Rights Reserved BlueStem Proprietary.

function varargout = GUI(varargin)
% GUI MATLAB code for GUI.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_OpeningFcn via varargin.

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI (see VARARGIN)

% Choose default command line output for GUI
handles.output = hObject;
% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% Update handles structure
guidata(hObject, handles);
kinematicmap([1,0,0],[0,1,0]);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%Type of plot to display in plotarea
% --- Executes on selection change in PlotTypeTag.
function PlotTypeTag_Callback(hObject, eventdata, handles)
% hObject    handle to PlotTypeTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns PlotTypeTag contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PlotTypeTag
contents = {get(hObject,'Value')};
setappdata(0,'PlotType',contents);

% --- Executes during object creation, after setting all properties.
function PlotTypeTag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PlotTypeTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
contents = {get(hObject,'Value')};
setappdata(0,'PlotType',contents);
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%Number of Nodes
function NoNodes_Callback(hObject, eventdata, handles)
% hObject    handle to NoNodes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of NoNodes as text
%        str2double(get(hObject,'String')) returns contents of NoNodes as a double
nonodes=str2double(get(hObject,'String'));

% --- Executes during object creation, after setting all properties.
function NoNodes_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NoNodes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%Number of Links
function NoLinks_Callback(hObject, eventdata, handles)
% hObject    handle to NoLinks (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of NoLinks as text
%        str2double(get(hObject,'String')) returns contents of NoLinks as a double

% --- Executes during object creation, after setting all properties.
function NoLinks_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NoLinks (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when entered data in editable cell(s) in DirectionTable.
function DirectionTable_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to DirectionTable (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Updatebutton1.
function Updatebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to Updatebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tableData = get(hObject.DirectionTable, 'data')

% --- Executes on button press in AddLinkTag.
function AddLinkTag_Callback(hObject, eventdata, handles)
% hObject    handle to AddLinkTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
oldData = get(handles.LinkTable,'Data');
newRow=[0,0,0]; 
newData = [oldData; newRow];
set(handles.LinkTable,'Data',newData)
oldData = get(handles.AxesTable1,'Data');
newRow=[0,0,0]; 
newData = [oldData; newRow];
set(handles.AxesTable1,'Data',newData)



%Type of transformation selection
% --- Executes on selection change in TransformTypeTag.
function TransformTypeTag_Callback(hObject, eventdata, handles)
% hObject    handle to TransformTypeTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns TransformTypeTag contents as cell array
%        contents={get(hObject,'Value')} returns selected item from TransformTypeTag
k=contents{get(hObject,'Value')}
setappdata(0,'transformtype',k);

% --- Executes during object creation, after setting all properties.
function TransformTypeTag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TransformTypeTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% k=get(handles.TransformTypeTag,'Value')
% setappdata(0,'transformtype',k);

% --- Executes on button press in AdjButton.
function AdjButton_Callback(hObject, eventdata, handles)
% hObject    handle to AdjButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Data = get(handles.LinkTable,'Data');
setappdata(0,'LinkTableData',Data)
adjacencyinput;


% --- Executes on button press in updatelinksbutton.
function updatelinksbutton_Callback(hObject, eventdata, handles)
% hObject    handle to updatelinksbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
oldData = get(handles.LinkTable, 'Data');
k=str2double(get(handles.NoLinks,'String'));
newData = zeros(k,3);
set(handles.LinkTable,'Data',newData)
oldData = get(handles.AxesTable1, 'Data');
k=str2double(get(handles.NoLinks,'String'));
newData = zeros(k,3);
set(handles.AxesTable1,'Data',newData)
data=get(handles.LinkTable,'Data');
setappdata(0,'linkdata',data);

% --- Executes on button press in deletelinkbutton.
function deletelinkbutton_Callback(hObject, eventdata, handles)
% hObject    handle to deletelinkbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
oldData = get(handles.LinkTable,'Data');
k=size(oldData,1);
newData = oldData(1:k-1,:);
set(handles.LinkTable,'Data',newData)
oldData = get(handles.AxesTable1,'Data');
k=size(oldData,1);
newData = oldData(1:k-1,:);
set(handles.AxesTable1,'Data',newData)
data=get(handles.LinkTable,'Data');
setappdata(0,'linkdata',data);

% --- Executes when entered data in editable cell(s) in AxesTable1.
function AxesTable1_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to AxesTable1 (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)



function dispwindow_Callback(hObject, eventdata, handles)
% hObject    handle to dispwindow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of dispwindow as text
%        str2double(get(hObject,'String')) returns contents of dispwindow as a double


% --- Executes during object creation, after setting all properties.
function dispwindow_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dispwindow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in mapbutton.
function mapbutton_Callback(hObject, eventdata, handles)
% hObject    handle to mapbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
q=get(handles.LinkTable,'Data');
Si=get(handles.AxesTable1,'Data');
try
QR_MAP=char(qrmap(q,Si));
% catch err
%        % Give more information for mismatch.
%    if (strcmp(err.identifier,'MATLAB:badsubscript'))
% 
%       msg = ['lol'];
%       error('MATLAB:myCode:dimensions', msg);
% 
%    % Display any other errors as usual.
%    else
%       rethrow(err);
%    end   
set(handles.dispwindow,'String',QR_MAP)
setappdata(0,'LinkDataPreTransform',q);
end

% --- Executes on button press in VisualRepButton.
function VisualRepButton_Callback(hObject, eventdata, handles)
% hObject    handle to VisualRepButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function plotarea_CreateFcn(hObject, eventdata, handles)
% hObject    handle to plotarea (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: place code in OpeningFcn to populate plotarea


% --- Executes on button press in diffmapbutton.
function diffmapbutton_Callback(hObject, eventdata, handles)
% hObject    handle to diffmapbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
differencemap

% --- Executes when entered data in editable cell(s) in LinkTable.
function LinkTable_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to LinkTable (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)



% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
delete(hObject);


% --- Executes during object deletion, before destroying properties.
function figure1_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in propertiesbutton.
function propertiesbutton_Callback(hObject, eventdata, handles)
% hObject    handle to propertiesbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in exportbutton.
function exportbutton_Callback(hObject, eventdata, handles)
% hObject    handle to exportbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in visualbutton.
function visualbutton_Callback(hObject, eventdata, handles)
% hObject    handle to visualbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function LinkTable_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LinkTable (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



% --- Executes on button press in transformbutton.
function transformbutton_Callback(hObject, eventdata, handles)
% hObject    handle to transformbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Ttype={get(handles.TransformTypeTag,'Value')};
Ttype=cell2mat(Ttype);
if Ttype==1
    Data = get(handles.AxesTable1,'Data');
    setappdata(0,'AxesTableData',Data);
    type1b
elseif Ttype==2
    Data = get(handles.LinkTable,'Data');
    setappdata(0,'LinkTableData',Data);
    type3
elseif Ttype==3
    type2a
elseif Ttype==4
    Data = get(handles.LinkTable,'Data');
    setappdata(0,'LinkTableData',Data);
    type2B
elseif Ttype==5
    type2c
elseif Ttype==6
    type4a
elseif Ttype==7
    Data = get(handles.LinkTable,'Data');
    fourtablesize=size(Data,1);
    fbtable=ones(fourtablesize,1)
    setappdata(0,'fbtable',fbtable);
    type4b
elseif Ttype==8
    type1a
end
% --- Executes during object creation, after setting all properties.
function transformbutton_CreateFcn(hObject, eventdata, handles)
% hObject    handle to transformbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
