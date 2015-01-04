function varargout = type3(varargin)
% TYPE3 MATLAB code for type3.fig
%      TYPE3, by itself, creates a new TYPE3 or raises the existing
%      singleton*.
%
%      H = TYPE3 returns the handle to a new TYPE3 or the handle to
%      the existing singleton*.
%
%      TYPE3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TYPE3.M with the given input arguments.
%
%      TYPE3('Property','Value',...) creates a new TYPE3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before type3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to type3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help type3

% Last Modified by GUIDE v2.5 02-Jan-2015 23:31:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @type3_OpeningFcn, ...
                   'gui_OutputFcn',  @type3_OutputFcn, ...
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


% --- Executes just before type3 is made visible.
function type3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to type3 (see VARARGIN)

% Choose default command line output for type3
handles.output = hObject;
initial_l=getappdata(0,'LinkTableData1');
set(handles.transformtable,'Data',initial_l);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes type3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = type3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function linkbox_Callback(hObject, eventdata, handles)
% hObject    handle to linkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of linkbox as text
%        str2double(get(hObject,'String')) returns contents of linkbox as a double


% --- Executes during object creation, after setting all properties.
function linkbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to linkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
v={get(handles.popupmenu1,'Value')};
v=cell2mat(v);
if v==2
    A=get(handles.transformtable,'Data');
    link=str2double(get(handles.linkbox,'String'));
    A([link],:)=[];
    set(handles.transformtable,'Data',A);
elseif v==1
    A=get(handles.transformtable,'Data');
    link=str2double(get(handles.linkbox,'String'));
    A = insertrows(A, [0,0,0], link);
    set(handles.transformtable,'Data',A);
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
A=get(handles.transformtable,'Data');
setappdata(0,'TransformedLinks',A);
close(gcf);
